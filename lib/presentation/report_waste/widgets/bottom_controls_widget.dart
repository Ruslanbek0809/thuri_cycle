import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thuri_cycle/application/auth/auth_bloc.dart';
import 'package:thuri_cycle/application/report_waste/location/location_cubit.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/dialog_helper.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/animated_message_box.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/error_messages.dart';
import 'package:thuri_cycle/router.gr.dart';

//TODO [fix]: location when installed for the 1st time
class BottomControlsWidget extends StatefulWidget {
  const BottomControlsWidget({required this.onAddWidgetPressed, super.key});
  final VoidCallback onAddWidgetPressed;

  @override
  State<BottomControlsWidget> createState() => _BottomControlsWidgetState();
}

class _BottomControlsWidgetState extends State<BottomControlsWidget>
    with TickerProviderStateMixin<BottomControlsWidget> {
  ErrorMessage? errorMessage;

  late final Timer appOpenedTimer;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    // Show errors about the location being loaded only after 2 seconds since the app is started
    // to avoid useless appearing and disappearing popups
    appOpenedTimer = Timer(const Duration(seconds: 3), _updateErrorMessage);

    // Animation tests:
    //Timer.periodic(Duration(milliseconds: 1), (t) { print("c"); isVersionCompatible = !isVersionCompatible; _updateErrorMessage(); });
    //Timer.periodic(Duration(milliseconds: 500), (t) { print("a"); get<VerifyTimeProvider>().update(); });
    //Timer.periodic(Duration(milliseconds: 400), (t) { print("b"); get<VerifyTimeProvider>().onAcceptedToReviewSettingChanged(false); });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final authBlocState = context.watch<AuthBloc>().state;

    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (p, c) => p != c,
          listener: (_, __) => _updateErrorMessage(),
        ),
        BlocListener<LocationCubit, LocationState>(
          listenWhen: (p, c) => p != c,
          listener: (_, __) => _updateErrorMessage(),
        ),
      ],
      child: Padding(
        padding: EdgeInsets.only(
          left: $constants.insets.sm + mediaQuery.padding.left,
          right: $constants.insets.sm + mediaQuery.padding.right,
          bottom: $constants.insets.sm + mediaQuery.padding.bottom,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'user',
              onPressed: () async {
                if (authBlocState == const AuthState.unauthenticated()) {
                  if (context.mounted) {
                    await DialogHelper.showCustomAlertDialog(
                      context,
                      title: context.l10n.logIn,
                      content: context.l10n.loginToDoAction,
                      cancelText: context.l10n.cancel,
                      confirmText: context.l10n.logIn,
                    ).then<void>((value) async {
                      if (value ?? false) {
                        if (context.mounted) {
                          await context.router.push(const LoginRoute());
                        }
                      }
                    });
                  }
                } else {
                  //TODO: Fix this. Can't access
                  await context.router.push(
                    const ProfileUserEditRoute(),
                  );
                }
              },
              backgroundColor: $constants.palette.main,
              tooltip: authBlocState == const AuthState.unauthenticated()
                  ? context.l10n.user
                  : context.l10n.login,
              child: authBlocState == const AuthState.unauthenticated()
                  ? Icon(
                      MdiIcons.accountAlertOutline,
                      color: $constants.palette.white,
                    )
                  : Icon(
                      MdiIcons.accountCheck,
                      color: $constants.palette.white,
                    ),
            ),

            //TODO: Handle this middle part properly
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
                child: const SizedBox.expand(),
                // AnimatedList(
                //   physics: const NeverScrollableScrollPhysics(),
                //   key: _listKey,
                //   shrinkWrap: true,
                //   initialItemCount: (errorMessage != null ? 1 : 0),
                //   itemBuilder: _buildMessage,
                // ),
              ),
            ),
            FloatingActionButton(
              onPressed:
                  // errorMessage == null ?
                  widget.onAddWidgetPressed
              // : null
              ,
              heroTag: 'addMarker',
              tooltip: context.l10n.report,
              // backgroundColor:
              //     //  errorMessage == null //
              //     //     ? null
              //     //     :
              //     theme.colorScheme.primaryContainer.withOpacity(0.38),
              // foregroundColor:
              //     // errorMessage == null //
              //     //     ? null
              //     //     :
              //     theme.colorScheme.onPrimaryContainer.withOpacity(0.38),
              disabledElevation: 0,
              backgroundColor: $constants.palette.main,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  $constants.corners.md + 2,
                ),
              ),
              child: Icon(
                Icons.add,
                color: $constants.palette.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateErrorMessage() {
    final prevErrorMessage = errorMessage;
    ErrorMessage? newErrorMessage;

    final authState = context.read<AuthBloc>().state;
    final locationInfoModel = context.read<LocationCubit>().state.maybeWhen(
          success: (locationInfoModel) => locationInfoModel,
          orElse: () => null,
        );

    newErrorMessage = getErrorMessage(
      locationInfoModel,
      isLoggedIn: authState == const AuthState.unauthenticated(),
    );

    if (appOpenedTimer.isActive &&
        newErrorMessage == ErrorMessage.locationIsLoading) {
      // do not show "Location is loading" for the first two seconds, since it might load faster
      newErrorMessage = null;
    }

    if (_listKey.currentState != null && newErrorMessage != prevErrorMessage) {
      if (newErrorMessage != null) {
        _listKey.currentState!.insertItem(0);
      }
      if (prevErrorMessage != null) {
        _listKey.currentState!.removeItem(
          newErrorMessage == null ? 0 : 1,
          (context, animation) =>
              _buildErrorMessage(context, animation, prevErrorMessage),
        );
      }
    }
    setState(() {
      errorMessage = newErrorMessage;
    });
  }

  // Widget _buildMessage(
  //   BuildContext context,
  //   int index,
  //   Animation<double> animation,
  // ) {
  //   if (errorMessage != null && index == 0) {
  //     return _buildErrorMessage(context, animation, errorMessage!);
  //   } else {
  //     // should be unreachable
  //     return const SizedBox.shrink();
  //   }
  // }

  Widget _buildErrorMessage(
    BuildContext context,
    Animation<double> animation,
    ErrorMessage message,
  ) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return AnimatedMessageBox(
      animation: animation,
      message: message.toLocalizedString(l10n),
      containerColor: theme.colorScheme.errorContainer,
      onContainerColor: theme.colorScheme.onErrorContainer,
      onTap: message == ErrorMessage.loginRequired
          ? () async => context.router.push(const LoginRoute())
          : message == ErrorMessage.grantLocationPermission
              ? Geolocator.openAppSettings
              : message == ErrorMessage.enableLocationServices
                  ? Geolocator.openLocationSettings
                  : null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    appOpenedTimer.cancel();
  }
}
