// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:talker_flutter/talker_flutter.dart' as _i207;
import 'package:thuri_cycle/application/app/app_cubit.dart' as _i227;
import 'package:thuri_cycle/application/app/locale/locale_cubit.dart' as _i1063;
import 'package:thuri_cycle/domain/app/theme_model.dart' as _i836;
import 'package:thuri_cycle/infastructure/core/dependency_injection/talker_module.dart'
    as _i159;

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
    gh.factory<_i1063.LocaleCubit>(() => _i1063.LocaleCubit());
    gh.singleton<_i207.Talker>(() => talkerModule.talkerFlutter);
    await gh.singletonAsync<_i836.ThemeModel>(
      () => _i836.ThemeModel.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i227.AppCubit>(() => _i227.AppCubit());
    return this;
  }
}

class _$TalkerModule extends _i159.TalkerModule {}
