import 'package:flutter/material.dart';
import 'package:job_posting/base/styles.dart';
import 'package:job_posting/screens/home.dart';
import 'package:job_posting/widgets/button.dart';
import 'package:job_posting/widgets/input_field.dart';
import 'package:job_posting/models/job_post.dart';

class AddJob extends StatelessWidget {
  // const AddJob({Key? key}) : super(key: key);

  TextEditingController jobTitle = TextEditingController();
  TextEditingController jobDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {

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
                  const Text("Add New Job",
                      style: TextStyle(
                          color: Colors.white, fontSize: 35, fontFamily: "Poppins", letterSpacing: -0.5
                      )
                  )
              ],
          ),
                const SizedBox(height: 31),
                InputField(
                    placeholderText: "Enter position name",
                    textController: jobTitle,
                ),
                const SizedBox(height: 28),
                InputField(
                    placeholderText: "Describe Requirement...",
                    maxLines: 13,
                    textController: jobDescription
                ),
                const Spacer(),
                Button(onPress: (){
                  if(jobTitle.text.isNotEmpty && jobDescription.text.isNotEmpty){
                    var data = JobPost(jobTitle.text, jobDescription.text);
                    Navigator.pop(context,data);
                  }else{
                    print("please fill this field.");
                  }
                }, text: "Submit Job")
        ])
      )
    );
  }
}
