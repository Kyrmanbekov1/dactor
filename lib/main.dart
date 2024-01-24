import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/screens/welcome_screen.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/widgets/shared_prefs_widget.dart';
import 'package:flutter_application_6/presentation/widgets/text_field_unfocus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => TextFieldUnfocus(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.white,
              elevation: 1,
            ),
            fontFamily: 'sf pro'
          ),
          home: SharedPrefsWidget(
            child: const WelcomeScreen(),
            ),
        ),
      ),
    );
  }
}

