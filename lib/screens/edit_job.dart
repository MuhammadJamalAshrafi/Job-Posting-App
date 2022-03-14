import 'package:flutter/material.dart';
import 'package:job_posting/base/styles.dart';
import 'package:job_posting/models/job_post.dart';
import 'package:job_posting/screens/home.dart';
import 'package:job_posting/widgets/button.dart';
import 'package:job_posting/widgets/input_field.dart';

class EditJob extends StatelessWidget {
  final String title;
  final String description;

  EditJob({Key? key, this.title = "", this.description = ""}) : super(key: key);

  TextEditingController positionName = TextEditingController();
  TextEditingController positionDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    positionName.text = title;
    positionDescription.text = description;

    return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: appPrimaryColor,
        body: Padding(
            padding: const EdgeInsets.only(top: 89, left: 27, right: 27, bottom: 59),
            child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: appSecondaryColor,
                            size: 35,
                          )
                      ),
                      const SizedBox(width: 31),
                      const Text("Edit Job",
                          style: TextStyle(
                              color: Colors.white, fontSize: 35, fontFamily: "Poppins", letterSpacing: -0.5
                          )
                      )
                    ],
                  ),
                  const SizedBox(height: 31),
                  InputField(
                      placeholderText: "Enter position name",
                      textController: positionName
                  ),
                  const SizedBox(height: 28),
                  InputField(
                    placeholderText: "Describe Requirement...",
                    maxLines: 13,
                    textController: positionDescription
                  ),
                  const Spacer(),
                  Button(onPress: (){
                    var data = JobPost(positionName.text, positionDescription.text);
                    Navigator.pop(context, data);
                  }, text: "Edit Job")
                ])
        )
    );
  }
}
