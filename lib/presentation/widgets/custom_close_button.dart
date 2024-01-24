import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    super.key,
    required this.onPressed
  });
final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){},
       icon: Icon(
        Icons.close,
        color: Colors.black
        .withOpacity(
          0.24
          ),
        ),
       );
  }
}