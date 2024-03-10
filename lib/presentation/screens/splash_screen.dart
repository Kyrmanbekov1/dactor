import 'package:flutter/material.dart';
import 'package:flutter_application_6/core/app_consts.dart';
import 'package:flutter_application_6/presentation/screens/auth/welcome_screen.dart';
import 'package:flutter_application_6/presentation/screens/home/home_screen.dart';
import 'package:flutter_application_6/presentation/widgets/shared_prefs_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
   routing();
    super.initState();
  }

  void routing() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
  await Future.delayed(const Duration(seconds: 2),);
    bool isLogined = prefs.getBool(AppConsts.isLogined)?? false;
     
     if (isLogined){
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen(),),);
     }
     else{
     // ignore: use_build_context_synchronously
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const WelcomeScreen(),),);

     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}