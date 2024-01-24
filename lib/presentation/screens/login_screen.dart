import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/core/app_consts.dart';
import 'package:flutter_application_6/presentation/screens/activation_number.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/app_button.dart';
import 'package:flutter_application_6/presentation/widgets/custom_text_field.dart';
import 'package:flutter_application_6/presentation/widgets/shared_prefs_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String phone = '';

    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          color: AppColors.black,
          onPressed: () {},
        ),
        title: const Text(
          'Вход',
          style: AppFonts.w600s17,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Войти',
              style: AppFonts.w700s34,
            ),
            SizedBox(
              height: 49.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: Column(
                  children: [
                    const Text(
                      'Номер телефона',
                      style: AppFonts.w400s15,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: CustomTextField(
                        onChanged: (val){
                          setState(() { });
                        },
                        controller: controller,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 11.0),
                      child: Text(
                        'На указанный вами номер придет однократное СМС-сообщение с кодом подтверждения. ',
                        style: AppFonts.w400s15,
                      ),
                    ),
                    Text(
                      phone,
                      style: AppFonts.w400s15,
                    ),
                    const Spacer(),
                    AppButton(
                      onPressed: controller.text.length < 9?
                      null:
                       () async {
                        int code = Random().nextInt(8999) + 1000;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(code.toString()),
                        ),
                        );
                        SharedPrefsWidget.prefs.setString(
                        await  AppConsts.pnoneNumber, 
                          controller.text,
                        );
      
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) =>  ActivationNumberScreen(code: code,),
                             ),
                             );
                      },
                      title: 'Далее',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
