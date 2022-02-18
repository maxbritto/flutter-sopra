import 'package:flutter/material.dart';
import 'package:nav_2/ecrans/login_screen.dart';
import 'package:nav_2/ecrans/login_viewmodel.dart';
import 'package:nav_2/navigation/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: appRouter,
      routerDelegate: appRouter,
    );
  }
}
