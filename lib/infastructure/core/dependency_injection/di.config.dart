// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:talker_flutter/talker_flutter.dart' as _i207;
import 'package:thuri_cycle/application/app/app_cubit.dart' as _i227;
import 'package:thuri_cycle/application/app/locale/locale_cubit.dart' as _i1063;
import 'package:thuri_cycle/application/auth/auth_bloc.dart' as _i390;
import 'package:thuri_cycle/application/auth/auth_form/auth_form_cubit.dart'
    as _i250;
import 'package:thuri_cycle/application/community/community_featured/community_featured_cubit.dart'
    as _i884;
import 'package:thuri_cycle/domain/app/theme_model.dart' as _i836;
import 'package:thuri_cycle/domain/auth/i_auth_facade.dart' as _i917;
import 'package:thuri_cycle/domain/community/i_community.dart' as _i153;
import 'package:thuri_cycle/infastructure/auth/auth_repository.dart' as _i767;
import 'package:thuri_cycle/infastructure/core/dependency_injection/firebase_injectable.module.dart'
    as _i63;
import 'package:thuri_cycle/infastructure/core/dependency_injection/talker_module.dart'
    as _i159;
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
    final talkerModule = _$TalkerModule();
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.factory<_i1063.LocaleCubit>(() => _i1063.LocaleCubit());
    gh.singleton<_i207.Talker>(() => talkerModule.talkerFlutter);
    await gh.singletonAsync<_i836.ThemeModel>(
      () => _i836.ThemeModel.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i116.GoogleSignIn>(
        () => firebaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i59.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i795.ScrollControllerService>(
      () => _i795.ScrollControllerService(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i227.AppCubit>(() => _i227.AppCubit());
    gh.lazySingleton<_i917.IAuth>(() => _i767.AuthRepository(
          gh<_i59.FirebaseAuth>(),
          gh<_i558.FlutterSecureStorage>(),
          gh<_i116.GoogleSignIn>(),
        ));
    gh.factory<_i884.CommunityFeaturedCubit>(
        () => _i884.CommunityFeaturedCubit(gh<_i153.ICommunity>()));
    gh.factory<_i250.AuthFormCubit>(
        () => _i250.AuthFormCubit(gh<_i917.IAuth>()));
    gh.factory<_i390.AuthBloc>(() => _i390.AuthBloc(
          gh<_i917.IAuth>(),
          gh<_i558.FlutterSecureStorage>(),
        ));
    return this;
  }
}

class _$TalkerModule extends _i159.TalkerModule {}

class _$FirebaseInjectableModule extends _i63.FirebaseInjectableModule {}
