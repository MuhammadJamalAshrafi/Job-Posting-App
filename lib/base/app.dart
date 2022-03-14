import 'package:flutter/material.dart';
import 'package:job_posting/base/styles.dart';
import 'package:job_posting/screens/add_job.dart';
import 'package:job_posting/screens/home.dart';

import 'package:job_posting/screens/signup.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: appPrimaryColor
      )
    );
  }
}
