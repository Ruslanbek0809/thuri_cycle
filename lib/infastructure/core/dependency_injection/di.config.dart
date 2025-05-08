// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:talker_flutter/talker_flutter.dart' as _i207;
import 'package:thuri_cycle/application/app/app_cubit.dart' as _i227;
import 'package:thuri_cycle/application/app/locale/locale_cubit.dart' as _i1063;
import 'package:thuri_cycle/application/auth/auth_bloc.dart' as _i390;
import 'package:thuri_cycle/application/auth/auth_form/auth_form_cubit.dart'
    as _i250;
import 'package:thuri_cycle/application/auth/profile_user_form/profile_user_form_cubit.dart'
    as _i124;
import 'package:thuri_cycle/application/community/community_articles/community_articles_cubit.dart'
    as _i790;
import 'package:thuri_cycle/application/community/community_featured/community_featured_cubit.dart'
    as _i884;
import 'package:thuri_cycle/application/community/community_guides/community_guides_cubit.dart'
    as _i243;
import 'package:thuri_cycle/application/community/community_single_guide/community_single_guide_cubit.dart'
    as _i749;
import 'package:thuri_cycle/application/profile/settings_form_cubit.dart'
    as _i225;
import 'package:thuri_cycle/application/report_waste/location/location_cubit.dart'
    as _i990;
import 'package:thuri_cycle/application/report_waste/map_marker_form_cubit.dart'
    as _i115;
import 'package:thuri_cycle/application/report_waste/report/report_form_cubit.dart'
    as _i401;
import 'package:thuri_cycle/application/report_waste/resolve/resolve_form_cubit.dart'
    as _i634;
import 'package:thuri_cycle/application/report_waste/single_marker_form_cubit/single_marker_form_cubit.dart'
    as _i804;
import 'package:thuri_cycle/domain/app/theme_model.dart' as _i836;
import 'package:thuri_cycle/domain/auth/i_auth_facade.dart' as _i917;
import 'package:thuri_cycle/domain/community/i_community.dart' as _i153;
import 'package:thuri_cycle/domain/report_waste/i_location.dart' as _i145;
import 'package:thuri_cycle/domain/report_waste/i_report.dart' as _i299;
import 'package:thuri_cycle/domain/report_waste/i_resolve.dart' as _i899;
import 'package:thuri_cycle/infastructure/auth/auth_repository.dart' as _i767;
import 'package:thuri_cycle/infastructure/community/community_repository.dart'
    as _i443;
import 'package:thuri_cycle/infastructure/core/dependency_injection/firebase_injectable.module.dart'
    as _i63;
import 'package:thuri_cycle/infastructure/core/dependency_injection/secure_storage_di.dart'
    as _i890;
import 'package:thuri_cycle/infastructure/core/dependency_injection/sharedPreferences_di.dart'
    as _i139;
import 'package:thuri_cycle/infastructure/core/dependency_injection/talker_module.dart'
    as _i159;
import 'package:thuri_cycle/infastructure/core/firebase_config/collections.dart'
    as _i357;
import 'package:thuri_cycle/infastructure/core/firebase_config/DB/firestore_service.dart'
    as _i575;
import 'package:thuri_cycle/infastructure/core/firebase_config/storage/firebase_storage.dart'
    as _i137;
import 'package:thuri_cycle/infastructure/core/local_storage/map_preferences.dart'
    as _i1048;
import 'package:thuri_cycle/infastructure/report_waste/location_repository.dart'
    as _i389;
import 'package:thuri_cycle/infastructure/report_waste/report_repository.dart'
    as _i195;
import 'package:thuri_cycle/infastructure/report_waste/resolve_repository.dart'
    as _i512;
import 'package:thuri_cycle/infastructure/scroll_controller/scroll_controller_service.dart'
    as _i795;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferencesInjection = _$SharedPreferencesInjection();
    final secureStorageInjection = _$SecureStorageInjection();
    final talkerModule = _$TalkerModule();
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesInjection.prefs,
      preResolve: true,
    );
    gh.factory<_i558.FlutterSecureStorage>(
        () => secureStorageInjection.storage());
    gh.singleton<_i207.Talker>(() => talkerModule.talkerFlutter);
    await gh.singletonAsync<_i836.ThemeModel>(
      () => _i836.ThemeModel.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i116.GoogleSignIn>(
        () => firebaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i59.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => firebaseInjectableModule.firestore);
    gh.lazySingleton<_i457.FirebaseStorage>(
        () => firebaseInjectableModule.firebaseStorage);
    gh.lazySingleton<_i795.ScrollControllerService>(
      () => _i795.ScrollControllerService(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i227.AppCubit>(() => _i227.AppCubit());
    gh.lazySingleton<_i357.UserCollection>(
        () => _i357.UserCollection(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i357.ArticlesCollection>(
        () => _i357.ArticlesCollection(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i357.GuidesCollection>(
        () => _i357.GuidesCollection(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i145.ILocationFacade>(() => _i389.LocationRepository());
    gh.lazySingleton<_i357.MapMarkersCollection>(
        () => _i357.MapMarkersCollection(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i1048.MapPreferences>(
        () => _i1048.MapPreferences(gh<_i460.SharedPreferences>()));
    gh.factory<_i1063.LocaleCubit>(
        () => _i1063.LocaleCubit(gh<_i460.SharedPreferences>()));
    gh.factory<_i225.SettingsFormCubit>(
        () => _i225.SettingsFormCubit(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i137.FirebaseStorageService>(
        () => _i137.FirebaseStorageService(gh<_i457.FirebaseStorage>()));
    gh.lazySingleton<_i575.FirestoreService>(
        () => _i575.FirestoreService(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i899.IResolveFacade>(() => _i512.ResolveRepository(
          gh<_i575.FirestoreService>(),
          gh<_i137.FirebaseStorageService>(),
          gh<_i357.MapMarkersCollection>(),
        ));
    gh.lazySingleton<_i153.ICommunity>(() => _i443.CommunityRepository(
          gh<_i137.FirebaseStorageService>(),
          gh<_i357.ArticlesCollection>(),
          gh<_i357.GuidesCollection>(),
        ));
    gh.lazySingleton<_i917.IAuth>(() => _i767.AuthRepository(
          gh<_i59.FirebaseAuth>(),
          gh<_i575.FirestoreService>(),
          gh<_i137.FirebaseStorageService>(),
          gh<_i357.UserCollection>(),
          gh<_i116.GoogleSignIn>(),
        ));
    gh.factory<_i250.AuthFormCubit>(
        () => _i250.AuthFormCubit(gh<_i917.IAuth>()));
    gh.factory<_i124.ProfileUserFormCubit>(
        () => _i124.ProfileUserFormCubit(gh<_i917.IAuth>()));
    gh.factory<_i804.SingleMarkerFormCubit>(
        () => _i804.SingleMarkerFormCubit(gh<_i917.IAuth>()));
    gh.factory<_i390.AuthBloc>(() => _i390.AuthBloc(
          gh<_i917.IAuth>(),
          gh<_i558.FlutterSecureStorage>(),
        ));
    gh.factory<_i990.LocationCubit>(
        () => _i990.LocationCubit(gh<_i145.ILocationFacade>()));
    gh.factory<_i634.ResolveFormCubit>(
        () => _i634.ResolveFormCubit(gh<_i899.IResolveFacade>()));
    gh.lazySingleton<_i299.IReportFacade>(() => _i195.ReportRepository(
          gh<_i137.FirebaseStorageService>(),
          gh<_i357.MapMarkersCollection>(),
        ));
    gh.factory<_i790.CommunityArticlesCubit>(
        () => _i790.CommunityArticlesCubit(gh<_i153.ICommunity>()));
    gh.factory<_i243.CommunityGuidesCubit>(
        () => _i243.CommunityGuidesCubit(gh<_i153.ICommunity>()));
    gh.factory<_i884.CommunityFeaturedCubit>(
        () => _i884.CommunityFeaturedCubit(gh<_i153.ICommunity>()));
    gh.factory<_i749.CommunitySingleGuideCubit>(
        () => _i749.CommunitySingleGuideCubit(gh<_i153.ICommunity>()));
    gh.factory<_i115.MapMarkerFormCubit>(() => _i115.MapMarkerFormCubit(
          gh<_i299.IReportFacade>(),
          gh<_i1048.MapPreferences>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i401.ReportFormCubit>(
        () => _i401.ReportFormCubit(gh<_i299.IReportFacade>()));
    return this;
  }
}

class _$SharedPreferencesInjection extends _i139.SharedPreferencesInjection {}

class _$SecureStorageInjection extends _i890.SecureStorageInjection {}

class _$TalkerModule extends _i159.TalkerModule {}

class _$FirebaseInjectableModule extends _i63.FirebaseInjectableModule {}
