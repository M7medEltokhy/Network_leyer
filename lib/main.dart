import 'package:flutter/material.dart';
import 'package:network_leyer/core/di/injector.dart';
import 'package:network_leyer/core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final appRouter = AppRouter();
  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    ),
  );
}
