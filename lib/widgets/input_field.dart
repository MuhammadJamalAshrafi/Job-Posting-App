import 'package:flutter/material.dart';
import 'package:job_posting/base/styles.dart';

class InputField extends StatelessWidget {
  // final String initialValue;
  final String placeholderText;
  final int maxLines;
  final bool isIcon;
  final TextEditingController? textController;


  const InputField({
    Key? key,
    this.placeholderText = "",
    this.maxLines = 1,
    this.isIcon = false,
    this.textController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
          color: appTextFieldOverlay,
          border: Border.all(color: appStrokeColor),
          borderRadius: BorderRadius.circular(15)
      ),
      child: TextField(
        style: const TextStyle(color: appSecondaryColor, fontSize: 20),
         maxLines: maxLines,
       controller: textController,
        decoration: InputDecoration(
            prefixIcon: (isIcon == true) ? (const Icon(Icons.search_rounded, color: appStrokeColor, size: 30)) : null,
            hintText: placeholderText,
            hintStyle: const TextStyle(color: appTextColor, fontSize: 20, fontFamily: "Poppins"),
            border: InputBorder.none
        ),
      ),
    );
  }
}
