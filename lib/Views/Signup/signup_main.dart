import 'package:flutter/material.dart';
import 'package:patientapp/Views/Signup/signup_desktop.dart';
import 'package:patientapp/Views/Signup/signup_mobile.dart';
import 'package:patientapp/responsive/responsive_layout.dart';

class signup_main extends StatelessWidget {
  const signup_main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return responsive_layout(mobileBody: signup_mobile(), desktopBody: signup_desktop());
  }
}
