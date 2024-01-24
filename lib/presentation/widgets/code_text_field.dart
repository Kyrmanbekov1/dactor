import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    super.key,
    required this.controller,
    this.errorText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String? errorText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged ,
      style: AppFonts.w600s18
      .copyWith(
        color: AppColors.black,
      ),
      controller: controller,
      obscureText: true,
      obscuringCharacter: '*',
      textAlign: TextAlign.center,
      maxLength: 4,
      decoration: InputDecoration(
        errorStyle: AppFonts.w600s18
        .copyWith(
          color: Colors.red,
        ),
        errorText: errorText,
        counterText: ' ',
        suffixIcon: CircleAvatar(
          radius: 17.5.r,
          backgroundColor: AppColors.iconBacgroundColor,
          child: IconButton(
            icon: Icon(
            Icons.close,
            color: AppColors.black,
            ),
          onPressed: (){
            controller.clear();
          },
          ),
        ),
        prefix: Text(
          'Код',
        style:  AppFonts.w600s18
        .copyWith(
          color: AppColors.black,
          ),
        
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.TextFieldcolor
          ),
        ),
      ),
    );
  }
}