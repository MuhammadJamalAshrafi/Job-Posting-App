import 'package:flutter/material.dart';
import 'package:job_posting/base/styles.dart';
import 'package:job_posting/screens/home.dart';
import 'package:job_posting/screens/login.dart';
import 'package:job_posting/widgets/button.dart';
import 'package:job_posting/widgets/input_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        body:
        CustomScrollView(
            reverse: true,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child:
                Padding(
                  padding: const EdgeInsets.only(top: 110, left: 27, bottom: 59, right: 27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Let’s sign you Up",
                        style: TextStyle(fontSize: 35, color: appSecondaryColor, fontFamily: "Poppins", fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 14),
                      const Text("Welcome\nJoin the community!",
                        style: TextStyle(fontSize: 30, color: appSecondaryColor, fontFamily: "Poppins"),
                      ),
                      const SizedBox(height: 47),
                      const InputField(placeholderText: "Enter your full name"),
                      const SizedBox(height: 20),
                      const InputField(placeholderText: "Enter your email address"),
                      const SizedBox(height: 20),
                      const InputField(placeholderText: "Enter your password"),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account ? ',
                            style: TextStyle(color: appTextColor, fontSize: 15, fontFamily: "Poppins"),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => LogIn())
                              );
                            },
                            child: const Text('Sign In',
                              style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Button(onPress: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Home())
                        );
                      }, text: "Sign Up")
                    ],
                  ),
                )
              )]
        )
     );
  }
}
