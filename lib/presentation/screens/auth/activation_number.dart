import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/screens/auth/create_profile.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/app_button.dart';
import 'package:flutter_application_6/presentation/widgets/code_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ActivationNumberScreen extends StatefulWidget {
   ActivationNumberScreen({super.key, required this.code});

   int code;
  @override
  State<ActivationNumberScreen> createState() => _ActivationNumberScreenState();
}

class _ActivationNumberScreenState extends State<ActivationNumberScreen> {
  final TextEditingController controller = TextEditingController();
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.buttoncolor,
          ),
        onPressed: (){},
        ),
        title: const Center(
          child:  Text(
            'Подтверждение номера',
            style: AppFonts.w600s17,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Введите код из смс',
              style: AppFonts.w500s22,
              ),
              SizedBox( 
              height: 147.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: CodeTextField(
                  onChanged: (val){
                    setState(() {});
                  },
                controller: controller, 
                errorText: errorText,),             
              ),
              SizedBox(
                  height: 24.h,
                ),
                TextButton(onPressed: (){
                  widget.code = Random().nextInt(8999)+1000;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(widget.code.toString(),
                      ),
                      ),
                      );
                      setState(() {  });
                          
                }, 
                child: Text(
                  'Получить код повторно',
                  style: AppFonts.w400s15
                  .copyWith(
                    color: AppColors.buttoncolor,
                    decoration: TextDecoration.underline,
                    ),
                  ),
                  ),
                  const Spacer(),
                  AppButton(onPressed: controller.text.length < 4? null :
                   (){
                    if(controller.text == widget.code.toString()){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateProfile()));
                     errorText = null;
                     setState(() {  });
                    }else {
                      errorText = 'Код неверный';
                     setState(() {   });                     
                    }                    

                  }, 
                  title: 'Далее',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
          ],
        ),
      ),
    );
  }
}


