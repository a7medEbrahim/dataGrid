import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:testapp/core/routes/routes.dart';

import 'core/service/cache_helper.dart';
import 'core/service/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return AppRoutes.onGenerate(settings);
      },
    );
  }
}
