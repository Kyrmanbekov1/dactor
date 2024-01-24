import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.onPressed
  });

final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:  onPressed,
     icon: Icon(
      Icons.settings,
      color: AppColors.black.withOpacity(0.75),
      size: 24.h,
      
     ),
     );
  }
}