import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/constants/fonts.dart';
import 'package:sample_app/views/information/add_information.dart';

import 'constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sample App",
      theme: ThemeData(
          fontFamily: AppFonts.regular,
          colorSchemeSeed: Ext.getMaterialColor(AppColors.kPrimary),
          scaffoldBackgroundColor: AppColors.transparent,
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.transparent,
              surfaceTintColor: AppColors.transparent)),
      home: const AddInformationScreen(),
    );
  }
}
