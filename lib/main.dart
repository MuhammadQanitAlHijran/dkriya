import 'package:flutter/material.dart';
import 'package:project_dkriya/pages/home/main_home.dart';
import 'package:project_dkriya/pages/splash_screen.dart';
import 'package:project_dkriya/pages/login_screen.dart';
import 'package:project_dkriya/pages/signup_page.dart';
import 'package:project_dkriya/pages/home/profile_page.dart';
import 'package:project_dkriya/provider/auth_provider.dart';
import 'package:project_dkriya/pages/home/setting.dart';
import 'package:project_dkriya/pages/home/keranjang.dart';
import 'package:project_dkriya/pages/home/prodak.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupPage(),
          '/profile': (context) => const ProfilePage(),
          '/home': (context) => const MainHome(),
          '/settings': (context) => SettingsPage(),
          '/keranjang' : (context) => ShoppingCartScreen(),
          '/prodak' : (context) => Prodak(),
        },
      ),
    );
  }
}
