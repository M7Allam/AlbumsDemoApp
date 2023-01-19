import 'package:albums_demo_app/core/services/services_locator.dart';
import 'package:albums_demo_app/core/utils/colors.dart';
import 'package:albums_demo_app/core/utils/router.dart';
import 'package:albums_demo_app/presentation/controllers/albums/albums_bloc.dart';
import 'package:albums_demo_app/presentation/controllers/auth/auth_bloc.dart';
import 'package:albums_demo_app/presentation/controllers/photos/photos_bloc.dart';
import 'package:albums_demo_app/presentation/screens/login_screen.dart';
import 'package:albums_demo_app/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  ServicesLocator().init();

  runApp(
    EasyLocalization(
        supportedLocales: const <Locale>[Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context){
            return serviceLocator<AuthBloc>();
          },
        ),
        BlocProvider<AlbumsBloc>(
          create: (BuildContext context){
            return serviceLocator<AlbumsBloc>();
          },
        ),
        BlocProvider<PhotosBloc>(
          create: (BuildContext context){
            return serviceLocator<PhotosBloc>();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Albums Demo App',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: AppColors.primary,
          backgroundColor: AppColors.white,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        home: LoginScreen(),
      ),
    );
  }
}