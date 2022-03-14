import 'package:flutter/material.dart';
import 'package:job_posting/base/styles.dart';

class Button extends StatelessWidget {
  final GestureTapCallback onPress;
  final String text;

  const Button({
    Key? key,
    required this.onPress,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: appSecondaryColor,
        ),
          child: Text(text,
              style: const TextStyle(
                  fontSize: 15, color: appPrimaryColor, fontFamily: "Poppins", fontWeight: FontWeight.w600)
          ),
      ),
    );
  }
}
