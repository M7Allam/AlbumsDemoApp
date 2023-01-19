import 'package:albums_demo_app/core/services/services_locator.dart';
import 'package:albums_demo_app/core/utils/router.dart';
import 'package:albums_demo_app/domain/entities/user.dart';
import 'package:albums_demo_app/presentation/components/app_button.dart';
import 'package:albums_demo_app/presentation/components/app_textfield.dart';
import 'package:albums_demo_app/presentation/controllers/auth/auth_bloc.dart';
import 'package:albums_demo_app/presentation/controllers/auth/auth_event.dart';
import 'package:albums_demo_app/presentation/controllers/auth/auth_state.dart';
import 'package:albums_demo_app/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is LoginSuccessAuthState){
          //TODO: navigateToAlbumsScreen
          serviceLocator.registerLazySingleton<User>(() => state.user);
          Navigator.popAndPushNamed(context, AppRoutes.albumsScreen,);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildTitle(),
                  const SizedBox(height: 64.0,),
                  _buildEmailTextField(),
                  const SizedBox(height: 32.0,),
                  _buildPasswordTextField(),
                  const SizedBox(height: 40.0,),
                  _buildLoginButton(context),
                  const SizedBox(height: 32.0,),
                  _buildChooseLanguage(context),
                  _buildLoading(),
                  _buildErrorMessage(),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(){
    return Text(
      LocaleKeys.welcomeBack.tr(),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildEmailTextField(){
    return AppTextFormField(
      controller: _emailTextController,
      hintText: LocaleKeys.email.tr(),
      prefixIcon: Icons.email_rounded,
      keyboardType: TextInputType.emailAddress,
      validator: (String? value){
        if(value == null){
          return null;
        }
        if (value.trim().isEmpty) {
          return LocaleKeys.emptyField.tr();
        }
        if (!value.trim().contains('@')) {
          return LocaleKeys.wrongEmailAddress.tr();
        }
      },
    );
  }

  Widget _buildPasswordTextField(){
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (BuildContext context, AuthState state){
          return AppTextFormField(
            controller: _passwordTextController,
            hintText: LocaleKeys.password.tr(),
            prefixIcon: Icons.lock_outline,
            suffixIcon: context.read<AuthBloc>().isPasswordTextSecure? Icons.visibility: Icons.visibility_off,
            onSuffixIconPressed: () {
              //TODO: securePasswordTextEvent
              context.read<AuthBloc>().add(const SecurePasswordTextAuthEvent());
            },
            keyboardType: TextInputType.visiblePassword,
            obscureText: context.read<AuthBloc>().isPasswordTextSecure,
            validator: (String? value){
              if(value == null){
                return null;
              }
              if (value.trim().isEmpty) {
                return LocaleKeys.emptyField.tr();
              }
              if (value.trim().length < 6) {
                return LocaleKeys.passwordErrorMsg.tr();
              }
            },
          );
        }
    );
  }

  Widget _buildLoginButton(BuildContext context){
    return Center(
      child: AppButton(
        text: LocaleKeys.login.tr(),
        onPressed: (){
          //TODO: signInEvent()
          if(_formKey.currentState!.validate() && context.read<AuthBloc>().state is! LoadingAuthState){
            context.read<AuthBloc>().add(SignInAuthEvent(
                _emailTextController.text.trim(),
                _passwordTextController.text.trim()
            ));
          }
        },
      ),
    );
  }

  Widget _buildLoading(){
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state){
        if(state is LoadingAuthState){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildErrorMessage(){
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state){
        if(state is ErrorAuthState){
          return Center(
            child: Text(
              state.failureMessage,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 14.0,
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildChooseLanguage(BuildContext context){
    return Column(
      children: [
        Text(LocaleKeys.chooseLanguage.tr()),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              text: LocaleKeys.English.tr(),
              fontSize: 12,
              paddingH: 16,
              onPressed: () async{
                //TODO: changeLanguageToEnglish
                await context.setLocale(const Locale('en'));
              },
            ),
            const SizedBox(width: 24.0,),
            AppButton(
              text: LocaleKeys.Arabic.tr(),
              fontSize: 12,
              paddingH: 16,
              onPressed: () async{
                //TODO: changeLanguageToArabic
                await context.setLocale(const Locale('ar'));
              },
            ),
          ],
        ),
      ],
    );
  }

}
