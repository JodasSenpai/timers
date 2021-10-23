
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'injection_container.config.dart';

//Service Locator
final sl = GetIt.instance;

const web = Environment('web');
const disableOnWeb = Environment('webDisabled');

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() {
  sl.registerLazySingleton<HiveInterface>(() => Hive);
  //todo temporary fix until flutter fixes dart:io in web
  $initGetIt(
    sl,
    environmentFilter: kIsWeb
        ? NoEnvOrContainsAll({web.name})
        : NoEnvOrContainsAll({disableOnWeb.name}),
  );
}

@module
abstract class RegisterModule {




}
