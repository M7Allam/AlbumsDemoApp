import 'package:albums_demo_app/presentation/screens/albums_screen.dart';
import 'package:albums_demo_app/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes{
  static const String loginScreen = '/';
  static const String albumsScreen = '/albums-screen';

}

abstract class AppRouter{
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginScreen:
        return MaterialPageRoute<dynamic>(builder: (_) => LoginScreen());
      case AppRoutes.albumsScreen:
        return MaterialPageRoute<dynamic>(builder: (_) => const AlbumsScreen());
    }
    return null;
  }
}