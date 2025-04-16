import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_bordered_avatar_image.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_svg_icon.dart';

class ProfileUserCard extends StatefulWidget {
  const ProfileUserCard({super.key});

  @override
  State<ProfileUserCard> createState() => _ProfileUserCardState();
}

class _ProfileUserCardState extends State<ProfileUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          $constants.corners.md + 6,
        ),
      ),
      child: BlocConsumer<ProfileUserFormCubit, ProfileUserFormState>(
        listenWhen: (previous, current) =>
            previous.optionOfSuccessOrFailure !=
            current.optionOfSuccessOrFailure,
        listener: (context, state) {
          state.optionOfSuccessOrFailure.fold(
            () => null,
            (a) => a.fold(
              (alert) {
                scaffoldMessengerKey.currentState
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBarHelper.createError(
                      message: alert.message,
                    ),
                  );
              },
              (r) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.userModel != current.userModel,
        builder: (context, state) {
          final userModel = state.userModel;
          return InkWell(
            onTap: () async {
              //TODO: Business
              // if (userModel.business != null) {
              //   await context.router.push(
              //     BusinessProfileDetailsRoute(
              //       businessProfile: userModel,
              //       profileFollowCubit: BlocProvider.of<ProfileFollowFormCubit>(
              //         context,
              //       ),
              //       isMyUser: true,
              //     ),
              //   );
              // } else {
              await context.router.push(
                PersonalProfileDetailsRoute(
                  userProfile: userModel,
                  profileFollowCubit: BlocProvider.of<ProfileFollowFormCubit>(
                    context,
                  ),
                  isMyUser: true,
                ),
              );
              // }
            },
            child: Ink(
              padding: EdgeInsets.symmetric(
                horizontal: $constants.insets.sm,
                vertical: $constants.insets.sm,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        if (userModel.avatar != null ||
                            (userModel.business != null &&
                                userModel.business!.avatar != null))
                          CustomBorderedAvatarImage(
                            image: userModel.business != null
                                ? userModel.business!.avatar
                                : userModel.avatar,
                            radius: 25,
                            size: Size(
                              getTabletType() ? 100 : 60,
                              getTabletType() ? 100 : 60,
                            ),
                          ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: $constants.insets.sm,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        userModel.business != null
                                            ? userModel.business!.name ?? ''
                                            : userModel.firstName ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: getTextTheme(context)
                                            .titleMedium!
                                            .copyWith(
                                              fontSize: responsiveFontSize(
                                                context,
                                                16,
                                              ),
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    //*--------------- BLUE TICK ---------------//
                                    if (userModel.business != null)
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: $constants.insets.xxs,
                                        ),
                                        child: CustomSvgIcon(
                                          icon: 'tick',
                                          color: $constants.palette.main,
                                          size: 22,
                                        ),
                                      ),
                                  ],
                                ),
                                Text(
                                  context.l10n.viewProfile,
                                  style: getTextTheme(context)
                                      .titleSmall!
                                      .copyWith(
                                        fontSize:
                                            responsiveFontSize(context, 14),
                                        color: $constants.palette.main,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: $constants.insets.xxs + 2),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: getTabletType() ? 28 : 14,
                      color: getThemeData(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
