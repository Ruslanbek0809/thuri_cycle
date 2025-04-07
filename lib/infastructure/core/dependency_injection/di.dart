import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/infastructure/core/dependency_injection/di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
    // ignoreUnregisteredTypes: [TokenStorage<String>],
    )
Future<void> configureDependencyInjection() async => getIt.init();
