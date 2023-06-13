import 'package:flutter/material.dart';
import 'package:kbc/utility/app_theme.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  int? index;

  AppButton({super.key, required this.onPressed, required this.text,this.index});

  @override
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:  index==0 || index==null?AppTheme.instance.colorLightGreen:Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: index==0 || index==null?Theme.of(context).textTheme.headlineSmall:const TextStyle(
            color: Colors.black,
            fontSize: 14,
            decoration: TextDecoration.none),
      ),
    );
  }}
