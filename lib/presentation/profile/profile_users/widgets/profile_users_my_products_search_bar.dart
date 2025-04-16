import 'package:flipgoo_app/application/product/products_search_actor_bloc/products_search_actor_bloc.dart';
import 'package:flipgoo_app/application/profile/settings_form_cubit.dart';
import 'package:flipgoo_app/domain/hive/hive_country.dart';
import 'package:flipgoo_app/infrastructure/core/dependency_injection/di.dart';
import 'package:flipgoo_app/l10n/l10n.dart';
import 'package:flipgoo_app/presentation/core/utils/constants.dart';
import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileUsersMyProductsSearchBar extends StatelessWidget {
  const ProfileUsersMyProductsSearchBar({
    this.homeProductType,
    super.key,
  });

  final HomeProductType? homeProductType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsSearchActorBloc>(),
      child: BlocBuilder<SettingsFormCubit, SettingsFormState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return ValueListenableBuilder(
            valueListenable: Hive.box<HiveCountry>(
              $constants.hiveCountryBox,
            ).listenable(),
            builder: (context, hiveCountryBox, _) {
              return Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: getThemeData(context).scaffoldBackgroundColor,
                  border: Border.all(
                    width: 0.5,
                    color: getThemeData(context).canvasColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    $constants.corners.md + 2,
                  ),
                ),
                child: SizedBox(
                  height: 50,
                  child: Card(
                    child: InkWell(
                      onTap: () async {
                        // await showSearch<ProductModel?>(
                        //   context: context,
                        //   delegate: CustomSearchDelegate(
                        //     categoryId,
                        //     homeProductType,
                        //     context,
                        //     BlocProvider.of<ProductsSearchActorBloc>(
                        //       context,
                        //     ),
                        //   ),
                        // );
                      },
                      borderRadius: BorderRadius.circular(
                        $constants.corners.md + 2,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: $constants.insets.sm,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.search,
                              size: 24,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? $constants.palette.white
                                  : $constants.palette.search,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: $constants.insets.xxs + 2,
                              ),
                              child: Text(
                                context.l10n.search,
                                style:
                                    getTextTheme(context).titleMedium!.copyWith(
                                          fontSize: responsiveFontSize(
                                            context,
                                            14.5,
                                          ),
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? $constants.palette.white
                                              : $constants.palette.search,
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
