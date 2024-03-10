import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
     this.onChanged,
  });

  final TextEditingController controller;
  final Function (String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      width: 266.w,
      child:  TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(11),
          prefixIcon: Icon(Icons.search),
          hintText: 'Поиск врача',
          hintStyle: AppFonts.w400s17,
          filled: true,
          fillColor: const Color.fromARGB(213, 210, 210, 224),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10),),
            borderSide: BorderSide(color: Color.fromARGB(213, 210, 210, 224)),
          ),
        ),
      ),
    );
  }
}