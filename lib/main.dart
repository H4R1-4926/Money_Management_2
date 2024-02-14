import 'package:fire_base_project/Application/bloc/home_bloc.dart';
import 'package:fire_base_project/Domain/Dependancy_injection/injectable.dart';
import 'package:fire_base_project/Presentation/Home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: const GetMaterialApp(
          debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}
