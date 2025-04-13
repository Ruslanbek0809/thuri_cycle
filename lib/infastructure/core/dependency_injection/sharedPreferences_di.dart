import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPreferencesInjection {
  @preResolve //* Pre-await the future and register its resolved value
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
