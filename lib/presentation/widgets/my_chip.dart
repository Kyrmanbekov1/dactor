import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';

class MyChip extends StatelessWidget {
  const MyChip({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onSelected
  });

  final String title;
  final bool isSelected;
  final Function (bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ChoiceChip(
        showCheckmark: false,
        avatarBorder: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColors.white
          ),
          borderRadius: BorderRadius.circular(
            4
            ),
        ),
        backgroundColor: AppColors.white,
        selectedColor: AppColors.buttoncolor,
        label:
        Text(
          title,
       style: AppFonts.w600s15,
       ), 
      selected: isSelected,
      onSelected: onSelected,),
    );
  }
}

