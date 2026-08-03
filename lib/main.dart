import 'package:flutter/material.dart';
import 'package:network_leyer/core/di/injector.dart';
import 'package:network_leyer/features/auth/presentation/screens/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();
    
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen()),
  );
}
