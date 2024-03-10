import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';

class CreateProfileTextField extends StatelessWidget {
  const CreateProfileTextField({super.key,
  required this.hintText,
  required this.title,
  required this.controller,
  });

  final String hintText;
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
       Text(
        title,
            style: AppFonts.w400s15,
            ),
            TextField(
              style: AppFonts.w600s18.copyWith(color: AppColors.black),
              controller: controller,
              decoration:  InputDecoration(
                hintText: hintText,
                hintStyle: AppFonts.w400s17,
                enabledBorder:  UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.black,
                    width: 1,
                    ),),
              ),
            ),
       ],
    );
  }
}