import 'package:fire_base_project/Domain/Dependancy_injection/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  $initGetIt(getIt, environment: Environment.prod);
}
