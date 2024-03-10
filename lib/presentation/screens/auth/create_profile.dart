import 'package:flutter/material.dart';
import 'package:flutter_application_6/core/app_consts.dart';
import 'package:flutter_application_6/presentation/screens/home/home_screen.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/app_button.dart';
import 'package:flutter_application_6/presentation/widgets/create_profile_text_field.dart';
import 'package:flutter_application_6/presentation/widgets/custom_text_field.dart';
import 'package:flutter_application_6/presentation/widgets/shared_prefs_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllername = TextEditingController();
    final TextEditingController controllersurename = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          color: AppColors.black,
          onPressed: () {},
        ),
        title: Text('Создание профиля',
        style: AppFonts.w500s22,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            CreateProfileTextField(
              title: 'Имя',
              hintText: 'Введите ваше имя',
              controller: controllername,
            ),
            SizedBox(
              height: 25,
            ),
            CreateProfileTextField(hintText: 'Введите вашу фамилию', 
            title: 'Фамилия', 
            controller: controllersurename
            ),
             const Spacer(),
            AppButton(onPressed: () async{
              final SharedPreferences prefs = SharedPrefsWidget.prefs;
              await prefs.setString(AppConsts.name, controllername.text);
              await prefs.setString(AppConsts.sureName, controllersurename.text );
                
                await prefs.setBool(AppConsts.isLogined, true);

                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(),));
            },
             title: 'Далее'
             ),
             SizedBox(
              height: 20,
             ),
          ],
          ),
      ),
    );
  }
}