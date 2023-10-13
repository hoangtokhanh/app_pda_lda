import 'package:app_pda_lda/presentation/app.dart';
import 'package:app_pda_lda/presentation/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  appController.prefs = await SharedPreferences.getInstance();
  await appController.getLoginData();
  runApp(const MyApp());
}

