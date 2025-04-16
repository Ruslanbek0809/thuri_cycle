import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flipgoo_app/application/app/locale/locale_cubit.dart';
import 'package:flipgoo_app/application/product/my_products/my_products_cubit.dart';
import 'package:flipgoo_app/application/profile/settings_form_cubit.dart';
import 'package:flipgoo_app/domain/auth/user_model/user_model.dart';
import 'package:flipgoo_app/domain/hive/hive_country.dart';
import 'package:flipgoo_app/domain/products/product.dart';
import 'package:flipgoo_app/domain/profile/address/address.dart';
import 'package:flipgoo_app/infrastructure/core/dependency_injection/di.dart';
import 'package:flipgoo_app/l10n/l10n.dart';
import 'package:flipgoo_app/library/countries_country_code_map.dart';
import 'package:flipgoo_app/presentation/core/utils/constants.dart';
import 'package:flipgoo_app/presentation/core/utils/methods/aliases.dart';
import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
import 'package:flipgoo_app/presentation/core/widgets/custom/custom_bordered_avatar_image.dart';
import 'package:flipgoo_app/presentation/core/widgets/custom/custom_image.dart';
import 'package:flipgoo_app/presentation/core/widgets/custom/custom_lottie_avatar.dart';
import 'package:flipgoo_app/presentation/core/widgets/custom/custom_lottie_loading.dart';
import 'package:flipgoo_app/presentation/core/widgets/custom/custom_opacity_back_button.dart';
import 'package:flipgoo_app/presentation/core/widgets/custom/custom_state.dart';
import 'package:flipgoo_app/presentation/core/widgets/keyboard_dismisser.dart';
import 'package:flipgoo_app/presentation/home/profiles/widgets/personal_profile_action_button.dart';
import 'package:flipgoo_app/presentation/home/profiles/widgets/personal_profile_contacts_modal_bottom_sheet.dart';
import 'package:flipgoo_app/presentation/home/profiles/widgets/profile_additional_item_card.dart';
import 'package:flipgoo_app/presentation/home/profiles/widgets/profile_verified_item.dart';
import 'package:flipgoo_app/presentation/profile/my_products/widgets/my_product_card.dart';
import 'package:flipgoo_app/presentation/profile/profile_users/widgets/profile_users_my_products_search_bar.dart';
import 'package:flipgoo_app/presentation/profile/profile_users/widgets/profile_users_view_only_follow_button.dart';
import 'package:flipgoo_app/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ProfileUserViewPage extends StatefulWidget {
  const ProfileUserViewPage({
    required this.userProfile,
    super.key,
  });

  final UserModel userProfile;

  @override
  State<ProfileUserViewPage> createState() => _ProfileUserViewPageState();
}

class _ProfileUserViewPageState extends State<ProfileUserViewPage> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  UserModel get userProfile => widget.userProfile;

  final additionalsAutoSizeGroup = AutoSizeGroup();
  final MyProductsCubit _myProductsCubit = getIt<MyProductsCubit>();

  final PagingController<int, ProductModel> _pagingController =
      PagingController(firstPageKey: 1);
  static const _pageSize = 20;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _myProductsCubit.getMyProducts(
        pageKey,
        _pageSize,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final safeTopPadding = MediaQuery.of(context).padding.top;
    return BlocProvider(
      create: (_) => _myProductsCubit,
      child: BlocListener<MyProductsCubit, MyProductsState>(
        bloc: _myProductsCubit,
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          state.mapOrNull(
            failed: (st) => _pagingController.error = st.alert,
            success: (st) {
              final isLastPage = st.myProducts.length < _pageSize;
              logIt.verbose(
                'isLastPage: $isLastPage, st.myProducts.length: ${st.myProducts.length}',
              );
              if (isLastPage) {
                _pagingController.appendLastPage(st.myProducts);
              } else {
                _pagingController.appendPage(
                  st.myProducts,
                  st.page + 1,
                );
              }
            },
          );
        },
        child: Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              return KeyboardDismisserWidget(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      //*------------------ USER HEADER SECTION ---------------------//
                      Stack(
                        children: [
                          Column(
                            children: [
                              //*------------------ USER BACKGROUND IMAGE / USER PLAN TYPE ---------------------//
                              Stack(
                                children: [
                                  CustomImage(
                                    image: userProfile.wallpaper ??
                                        getProfileBackground(context),
                                    height: getSize(context).height * 0.2,
                                    width: getSize(context).width,
                                  ),
                                  //*------------------ USER PLAN TYPE ---------------------//
                                  Positioned(
                                    right: $constants.insets.sm,
                                    bottom: $constants.insets.sm,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          $constants.corners.sm + 1,
                                        ),
                                        color:
                                            $constants.palette.cardBackground,
                                        gradient: LinearGradient(
                                          colors: userProfile.subscription !=
                                                  null
                                              ? userProfile
                                                          .subscription!.type !=
                                                      'free'
                                                  ? userProfile.subscription!
                                                              .type ==
                                                          'premium'
                                                      ? [
                                                          $constants.palette
                                                              .gradientColorPurple1,
                                                          $constants.palette
                                                              .gradientColorPurple2,
                                                        ]
                                                      : userProfile
                                                                  .subscription!
                                                                  .type ==
                                                              'business'
                                                          ? [
                                                              $constants.palette
                                                                  .gradientColorGreen1,
                                                              $constants.palette
                                                                  .gradientColorGreen2,
                                                            ]
                                                          : [
                                                              $constants.palette
                                                                  .gradientColorBlue1,
                                                              $constants.palette
                                                                  .gradientColorBlue2,
                                                            ]
                                                  : [
                                                      $constants.palette
                                                          .gradientColorBlue1,
                                                      $constants.palette
                                                          .gradientColorBlue2,
                                                    ]
                                              : [
                                                  $constants.palette
                                                      .gradientColorBlue1,
                                                  $constants.palette
                                                      .gradientColorBlue2,
                                                ],
                                        ),
                                      ),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(
                                          $constants.corners.sm + 1,
                                        ),
                                        onTap: () async {
                                          await context.router.push(
                                            const UserSubscriptionPlanRoute(),
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                $constants.insets.xs + 2,
                                            vertical: $constants.insets.xxs,
                                          ),
                                          child: Text(
                                            userProfile.subscription != null
                                                ? userProfile.subscription!
                                                            .type !=
                                                        'free'
                                                    ? userProfile.subscription!
                                                                .type ==
                                                            'premium'
                                                        ? context
                                                            .l10n.premiumPlan
                                                        : userProfile
                                                                    .subscription!
                                                                    .type ==
                                                                'business'
                                                            ? context.l10n
                                                                .businessPlan
                                                            : 'Unknown'
                                                    : context.l10n.freePlan
                                                : 'NULL',
                                            style: getTextTheme(context)
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: responsiveFontSize(
                                                    context,
                                                    12.75,
                                                  ),
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      $constants.palette.white,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //*------------------ USER INFO ---------------------//
                              Padding(
                                padding: EdgeInsets.only(
                                  top: $constants.insets.lg +
                                      $constants.insets.xs,
                                  bottom: $constants.insets.sm,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //*------------------ USER INFO ---------------------//
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: $constants.insets.sm,
                                      ),
                                      child: Text(
                                        userProfile.firstName ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: getTextTheme(context)
                                            .titleMedium!
                                            .copyWith(
                                              fontSize: responsiveFontSize(
                                                context,
                                                18.25,
                                              ),
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                    ),
                                    //*------------------ USER VERIFICATION / JOIN DATE ---------------------//
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: $constants.insets.xs + 2,
                                        left: $constants.insets.sm,
                                        right: $constants.insets.sm,
                                      ),
                                      child: Row(
                                        children: [
                                          if ((userProfile.mobile != null &&
                                                  userProfile
                                                      .mobile!.isNotEmpty) ||
                                              (userProfile.email != null &&
                                                  userProfile
                                                      .email!.isNotEmpty))
                                            Text(
                                              context.l10n.verified,
                                              style: getTextTheme(context)
                                                  .titleSmall!
                                                  .copyWith(
                                                    fontSize:
                                                        responsiveFontSize(
                                                      context,
                                                      12.75,
                                                    ),
                                                    color: getThemeData(context)
                                                        .hintColor,
                                                  ),
                                            ),
                                          if (userProfile.mobile!.isNotEmpty)
                                            const ProfileVerifiedItem(
                                              svgName: 'call',
                                            ),
                                          if (userProfile.email != null &&
                                              userProfile.email!.isNotEmpty)
                                            const ProfileVerifiedItem(
                                              svgName: 'sms',
                                            ),
                                          if (userProfile.createdAt != null)
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          $constants.insets.xs +
                                                              2,
                                                    ),
                                                    child: Text(
                                                      '•',
                                                      style:
                                                          getTextTheme(context)
                                                              .titleSmall!
                                                              .copyWith(
                                                                fontSize:
                                                                    responsiveFontSize(
                                                                  context,
                                                                  7.5,
                                                                ),
                                                                color: getThemeData(
                                                                        context)
                                                                    .hintColor,
                                                              ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '${context.l10n.joined} ${timeago.format(
                                                      userProfile.createdAt!,
                                                      locale: context
                                                          .read<LocaleCubit>()
                                                          .state
                                                          .locale
                                                          .languageCode,
                                                    )}',
                                                    style: getTextTheme(context)
                                                        .titleSmall!
                                                        .copyWith(
                                                          fontSize:
                                                              responsiveFontSize(
                                                            context,
                                                            12.75,
                                                          ),
                                                          color: getThemeData(
                                                                  context)
                                                              .hintColor,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    //*------------------ PROFILE USER ADDITIONALS / CONTACTS ---------------------//
                                    SizedBox(height: $constants.insets.xxs),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: $constants.insets.xs + 2,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //*------------------ PROFILE USER ADDITIONALS ---------------------//
                                          Expanded(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: ProfileAdditionalItem(
                                                    title: context.l10n
                                                        .productUpperLetter,
                                                    value:
                                                        NumberFormat.compact()
                                                            .format(
                                                      userProfile
                                                              .productsCount ??
                                                          0,
                                                    ),
                                                    autoSizeGroup:
                                                        additionalsAutoSizeGroup,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: ProfileAdditionalItem(
                                                    title:
                                                        context.l10n.following,
                                                    value:
                                                        NumberFormat.compact()
                                                            .format(
                                                      userProfile
                                                              .followingsCount ??
                                                          0,
                                                    ),
                                                    autoSizeGroup:
                                                        additionalsAutoSizeGroup,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: ProfileAdditionalItem(
                                                    title:
                                                        context.l10n.followers,
                                                    value:
                                                        NumberFormat.compact()
                                                            .format(
                                                      userProfile
                                                              .followersCount ??
                                                          0,
                                                    ),
                                                    autoSizeGroup:
                                                        additionalsAutoSizeGroup,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          //*------------------ PROFILE USER CONTACTS ---------------------//
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: $constants.insets.xs + 4,
                                            ),
                                            child: PersonalProfileActionButton(
                                              buttonSvgName: 'contacts',
                                              onTap: () async {
                                                // UniversalPlatform.isIOS
                                                //     ? showCupertinoModalBottomSheet(
                                                //         context: context,
                                                //         expand: true,
                                                //         enableDrag: false,
                                                //         backgroundColor: Colors.transparent,
                                                //         builder: (context) => const FilterCupertinoModalBottomSheet(),
                                                //       )
                                                //     :
                                                await showMaterialModalBottomSheet<
                                                    void>(
                                                  context: context,
                                                  builder: (context) =>
                                                      PersonalProfileContactsModalBottomSheet(
                                                    userModel: userProfile,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //*------------------ USER ACTION BUTTONS ---------------------//
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: $constants.insets.sm,
                                      ),
                                      child: Row(
                                        children: [
                                          //*------------------ USER FOLLOW BUTTON ---------------------//
                                          const ProfileUsersViewOnlyFollowButton(),
                                          //*------------------ USER PHONE BUTTON ---------------------//
                                          if (userProfile.mobile != null &&
                                              userProfile.mobile!.isNotEmpty)
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: $constants.insets.xs + 4,
                                              ),
                                              child:
                                                  PersonalProfileActionButton(
                                                buttonSvgName: 'phone_outlined',
                                                onTap: () async {
                                                  final launchUri = Uri(
                                                    scheme: 'tel',
                                                    path: '+${countriesCountryCode[userProfile.mobileIsoCode != null ? IsoCode.fromJson(
                                                        userProfile
                                                            .mobileIsoCode!,
                                                      ) : IsoCode.TM]}${userProfile.mobile ?? ''}',
                                                  );
                                                  await launchUrl(launchUri);
                                                },
                                              ),
                                            ),
                                          //*------------------ USER EMAIL BUTTON ---------------------//
                                          if (userProfile.email != null &&
                                              userProfile.email!.isNotEmpty)
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: $constants.insets.xs + 4,
                                              ),
                                              child:
                                                  PersonalProfileActionButton(
                                                buttonSvgName: 'email_outlined',
                                                onTap: () async {
                                                  final launchUri = Uri(
                                                    scheme: 'mailto',
                                                    path: userProfile.email,
                                                  );
                                                  await launchUrl(launchUri);
                                                },
                                              ),
                                            ),
                                          //*------------------ USER LOCATION BUTTON ---------------------//
                                          if ((userProfile.location != null &&
                                                  userProfile
                                                      .location!.isNotEmpty) ||
                                              (userProfile.addressText !=
                                                      null &&
                                                  userProfile
                                                      .addressText!.isNotEmpty))
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: $constants.insets.xs + 4,
                                              ),
                                              child:
                                                  PersonalProfileActionButton(
                                                buttonSvgName:
                                                    'location_outlined',
                                                onTap: () async {
                                                  if (userProfile.location !=
                                                          null &&
                                                      userProfile.location!
                                                          .isNotEmpty) {
                                                    await context.router.push(
                                                      GoogleMapsReadOnlyRoute(
                                                        addressModel:
                                                            AddressModel(
                                                          location: userProfile
                                                              .location,
                                                          latitude: userProfile
                                                              .latitude,
                                                          longitude: userProfile
                                                              .longitude,
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    // UniversalPlatform.isIOS
                                                    //     ? showCupertinoModalBottomSheet(
                                                    //         context: context,
                                                    //         expand: true,
                                                    //         enableDrag: false,
                                                    //         backgroundColor: Colors.transparent,
                                                    //         builder: (context) => const FilterCupertinoModalBottomSheet(),
                                                    //       )
                                                    //     :
                                                    await showMaterialModalBottomSheet<
                                                        void>(
                                                      context: context,
                                                      builder: (context) =>
                                                          PersonalProfileContactsModalBottomSheet(
                                                        userModel: userProfile,
                                                        profileContactType:
                                                            ProfileContactType
                                                                .location,
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          //*------------------ USER IMAGE ---------------------//
                          Positioned(
                            top: getSize(context).height * 0.2 - 60,
                            left: $constants.insets.sm,
                            child: userProfile.avatar != null
                                ? CustomBorderedAvatarImage(
                                    image: userProfile.avatar,
                                    radius: 42.5,
                                  )
                                : const CustomLottieAvatar(),
                          ),
                          Positioned(
                            top: safeTopPadding + $constants.insets.sm,
                            left: $constants.insets.sm,
                            child: const CustomOpacityBackButton(),
                          ),
                        ],
                      ),
                      //*------------------ USER PRODUCTS SECTION ---------------------//
                      const Divider(),
                      //*------------------ BUSINESS USER PRODUCTS TITLE ---------------------//
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<SettingsFormCubit, SettingsFormState>(
                            buildWhen: (previous, current) =>
                                previous != current,
                            builder: (context, state) {
                              return ValueListenableBuilder(
                                valueListenable: Hive.box<HiveCountry>(
                                  $constants.hiveCountryBox,
                                ).listenable(),
                                builder: (context, hiveCountryBox, _) {
                                  final hiveCountry = hiveCountryBox.values
                                          .toList()
                                          .isNotEmpty
                                      ? hiveCountryBox.values.first
                                      : null; //* If hiveCountryBox is not empty, get first and only object from it

                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: $constants.insets.sm,
                                      bottom: $constants.insets.xs + 2,
                                      left: $constants.insets.sm,
                                      right: $constants.insets.sm,
                                    ),
                                    child: Text(
                                      '${context.l10n.productsIn} ${hiveCountry?.name ?? state.countryModel?.name ?? ''}',
                                      style: getTextTheme(context)
                                          .titleMedium!
                                          .copyWith(
                                            fontSize: responsiveFontSize(
                                                context, 16.5),
                                            fontWeight: FontWeight.w600,
                                            color: $constants.palette.main,
                                          ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          //*------------------ USER SEARCH MY PRODUCTS ---------------------//

                          Padding(
                            padding: EdgeInsets.only(
                              bottom: $constants.insets.sm,
                              left: $constants.insets.sm,
                              right: $constants.insets.sm,
                            ),
                            child: const ProfileUsersMyProductsSearchBar(),
                          ),
                          PagedListView<int, ProductModel>.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            pagingController: _pagingController,
                            padding: EdgeInsets.only(
                              bottom: $constants.insets.sm,
                              left: $constants.insets.sm,
                              right: $constants.insets.sm,
                            ),
                            builderDelegate:
                                PagedChildBuilderDelegate<ProductModel>(
                              firstPageErrorIndicatorBuilder: (context) =>
                                  Container(
                                constraints: BoxConstraints(
                                  minHeight: getSize(context).width / 2 -
                                      $constants.insets
                                          .offset, //* REMOVES SEARCH height using $constants.insets.offset
                                ),
                                child: CustomState(
                                  svgName: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? 'assets/empty/error.svg'
                                      : 'assets/empty/error_dark.svg',
                                  text: context.l10n.error,
                                  onTap: () async {
                                    await Future.sync(
                                      _pagingController.refresh,
                                    );
                                  },
                                ),
                              ),
                              noItemsFoundIndicatorBuilder: (_) => Container(
                                constraints: BoxConstraints(
                                  minHeight: getSize(context).width / 2 -
                                      $constants.insets
                                          .offset, //* REMOVES SEARCH height using $constants.insets.offset
                                ),
                                child: CustomState(
                                  svgName: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? 'assets/empty/empty.svg'
                                      : 'assets/empty/empty_dark.svg',
                                  text: context.l10n.noAddedProducts,
                                  button: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 24,
                                        color: $constants.palette.white,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: $constants.insets.xxs,
                                        ),
                                        child: Text(
                                          context.l10n.addProduct,
                                          style: getTextTheme(context)
                                              .titleMedium!
                                              .copyWith(
                                                fontSize: responsiveFontSize(
                                                  context,
                                                  14.5,
                                                ),
                                                color: $constants.palette.white,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () async {
                                    await context.router
                                        .push(const AddProductRoute());
                                  },
                                ),
                              ),
                              firstPageProgressIndicatorBuilder: (_) =>
                                  Container(
                                constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight / 2 -
                                      ($constants.insets
                                          .offset), //* REMOVES SEARCH/FILTER height using $constants.insets.offset
                                ),
                                child: const CustomLottieLoading(
                                    isSearchBar: true),
                              ),
                              itemBuilder: (_, product, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    await context.router.push(
                                      ProductDetailsRoute(
                                        productId: product.id ?? -1,
                                        isMyProduct: true,
                                      ),
                                    );
                                  },
                                  child: MyProductCard(
                                    product: product,
                                    isMyProduct: true,
                                    onEditPressed: () async {
                                      await context.router.push(
                                        EditProductRoute(
                                          productId: product.id ?? -1,
                                          refreshCallback:
                                              _pagingController.refresh,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                            separatorBuilder: (context, index) => Container(
                              margin: EdgeInsets.symmetric(
                                vertical: $constants.insets.sm + 4,
                              ),
                              height: 0.5,
                              color: getThemeData(context).canvasColor,
                            ),
                          ),
                        ],
                      ),
                      //
                      // BlocBuilder<MyProductsCubit, MyProductsState>(
                      //   buildWhen: (previous, current) => previous != current,
                      //   builder: (context, state) {
                      //     return state.maybeWhen(
                      //       orElse: Container.new,
                      //       loading: () => Container(
                      //         constraints: BoxConstraints(
                      //           minHeight: getSize(context).width / 2 -
                      //               $constants.insets
                      //                   .offset, //* REMOVES SEARCH height using $constants.insets.offset
                      //         ),
                      //         child: const CustomLottieLoading(isSearchBar: true),
                      //       ),
                      //       failed: (alert) => Container(
                      //         constraints: BoxConstraints(
                      //           minHeight: getSize(context).width / 2 -
                      //               $constants.insets
                      //                   .offset, //* REMOVES SEARCH height using $constants.insets.offset
                      //         ),
                      //         child: CustomState(
                      //           svgName: Theme.of(context).brightness == Brightness.light ? 'assets/empty/error.svg' : 'assets/empty/error_dark.svg',
                      //           text: context.l10n.error,
                      //           onTap: () async {
                      //             await context
                      //                 .read<MyProductsCubit>()
                      //                 .getMyProducts();
                      //           },
                      //         ),
                      //       ),
                      //       success: (myProducts) => myProducts.isEmpty
                      //           ? Container(
                      //               constraints: BoxConstraints(
                      //                 minHeight: getSize(context).width / 2 -
                      //                     $constants.insets
                      //                         .offset, //* REMOVES SEARCH height using $constants.insets.offset
                      //               ),
                      //               child: CustomState(
                      //                 svgName: Theme.of(context).brightness == Brightness.light ? 'assets/empty/empty.svg' : 'assets/empty/empty_dark.svg',
                      //                 text: context.l10n.noAddedProducts,
                      //                 button: Row(
                      //                   mainAxisAlignment: MainAxisAlignment.center,
                      //                   children: [
                      //                     Icon(
                      //                       Icons.add,
                      //                       size: 24,
                      //                       color:
                      //                           getThemeData(context).canvasColor,
                      //                     ),
                      //                     Padding(
                      //                       padding: EdgeInsets.only(
                      //                         left: $constants.insets.xxs,
                      //                       ),
                      //                       child: Text(
                      //                         context.l10n.addProduct,
                      //                         style: getTextTheme(context)
                      //                             .titleMedium!
                      //                             .copyWith(
                      //                               fontSize: responsiveFontSize(
                      //                                 context,
                      //                                 14.5,
                      //                               ),
                      //                               color: $constants.palette.white,
                      //                             ),
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //                 onTap: () async {
                      //                   await context.router.push(const AddProductRoute());
                      //                 },
                      //               ),
                      //             )
                      //           : RefreshIndicator(
                      //               key: refreshIndicatorKey,
                      //               backgroundColor: getThemeData(context)
                      //                   .scaffoldBackgroundColor,
                      //               onRefresh: () async {
                      //                 await context
                      //                     .read<MyProductsCubit>()
                      //                     .getMyProducts();
                      //               },
                      //               child: Column(
                      //                 crossAxisAlignment: CrossAxisAlignment.start,
                      //                 children: [
                      //                   //*------------------ BUSINESS USER PRODUCTS TITLE ---------------------//
                      //                   BlocBuilder<SettingsFormCubit,
                      //                       SettingsFormState>(
                      //                     buildWhen: (previous, current) =>
                      //                         previous != current,
                      //                     builder: (context, state) {
                      //                       return ValueListenableBuilder(
                      //                         valueListenable:
                      //                             Hive.box<HiveCountry>(
                      //                           $constants.hiveCountryBox,
                      //                         ).listenable(),
                      //                         builder:
                      //                             (context, hiveCountryBox, _) {
                      //                           final hiveCountry = hiveCountryBox
                      //                                   .values
                      //                                   .toList()
                      //                                   .isNotEmpty
                      //                               ? hiveCountryBox.values.first
                      //                               : null; //* If hiveCountryBox is not empty, get first and only object from it

                      //                           return Padding(
                      //                             padding: EdgeInsets.only(
                      //                               top: $constants.insets.sm,
                      //                               bottom:
                      //                                   $constants.insets.xs + 2,
                      //                               left: $constants.insets.sm,
                      //                               right: $constants.insets.sm,
                      //                             ),
                      //                             child: Text(
                      //                               '${context.l10n.productsIn} ${hiveCountry?.name ?? state.countryModel?.name ?? ''}',
                      //                               style: getTextTheme(context)
                      //                                   .titleMedium!
                      //                                   .copyWith(
                      //                                     fontSize:
                      //                                         responsiveFontSize(
                      //                                             context, 16.5),
                      //                                     fontWeight:
                      //                                         FontWeight.w600,
                      //                                     color: $constants
                      //                                         .palette.main,
                      //                                   ),
                      //                             ),
                      //                           );
                      //                         },
                      //                       );
                      //                     },
                      //                   ),
                      //                   //*------------------ USER SEARCH MY PRODUCTS ---------------------//
                      //                   Padding(
                      //                     padding: EdgeInsets.only(
                      //                       bottom: $constants.insets.sm,
                      //                       left: $constants.insets.sm,
                      //                       right: $constants.insets.sm,
                      //                     ),
                      //                     child:
                      //                         const ProfileUsersMyProductsSearchBar(),
                      //                   ),
                      //                   //*------------------ USER MY PRODUCTS LIST ---------------------//
                      //                   ListView.separated(
                      //                     shrinkWrap: true,
                      //                     physics:
                      //                         const NeverScrollableScrollPhysics(),
                      //                     padding: EdgeInsets.only(
                      //                       bottom: $constants.insets.sm,
                      //                       left: $constants.insets.sm,
                      //                       right: $constants.insets.sm,
                      //                     ),
                      //                     itemCount: myProducts.length,
                      //                     itemBuilder: (context, index) {
                      //                       return GestureDetector(
                      //                         onTap: () async {
                      //                           await context.router.push(
                      //                             ProductDetailsRoute(
                      //                               productId:
                      //                                   myProducts[index].id ?? -1,
                      //                               isMyProduct: true,
                      //                             ),
                      //                           );
                      //                         },
                      //                         child: MyProductCard(
                      //                           product: myProducts[index],
                      //                           onEditPressed: () async {
                      //                             await context.router.push(
                      //                               EditProductRoute(
                      //                                 productId:
                      //                                     myProducts[index].id ??
                      //                                         -1,
                      //                               ),
                      //                             );
                      //                           },
                      //                         ),
                      //                       );
                      //                     },
                      //                     separatorBuilder: (context, index) =>
                      //                         Container(
                      //                       margin: EdgeInsets.symmetric(
                      //                         vertical: $constants.insets.sm + 4,
                      //                       ),
                      //                       height: 0.5,
                      //                       color:
                      //                           getThemeData(context).canvasColor,
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
