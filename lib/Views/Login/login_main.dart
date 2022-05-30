import 'package:flutter/material.dart';
import 'package:patientapp/Views/Login/login_desktop.dart';
import 'package:patientapp/Views/Login/login_mobile.dart';
import 'package:patientapp/responsive/responsive_layout.dart';

class login_main extends StatelessWidget {
  const login_main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const responsive_layout(mobileBody: login_mobile(), desktopBody: login_desktop());
  }

}
