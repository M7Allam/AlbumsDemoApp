// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "English": "English",
  "Arabic": "Arabic",
  "welcomeBack": "Welcome back!",
  "email": "Email",
  "emptyField": "Empty field!",
  "wrongEmailAddress": "Wrong email address!",
  "login": "Login",
  "password": "Password",
  "passwordErrorMsg": "Password must at least 6 characters!",
  "albums": "Albums",
  "chooseLanguage": "Choose Language:"
};
static const Map<String,dynamic> ar = {
  "English": "الانجليزية",
  "Arabic": "العربية",
  "welcomeBack": "مرحبا بعودتك!",
  "email": "البريد الإلكتروني",
  "emptyField": "حقل فارغ!",
  "wrongEmailAddress": "بريد إلكتروني خاطئ!",
  "login": "تسجيل الدخول",
  "password": "كلمة المرور",
  "passwordErrorMsg": "يجب أن تحتوى كلمة المرور على 6 أحرف على الاقل!",
  "albums": "الألبومات",
  "chooseLanguage": "اختر اللغة:"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
