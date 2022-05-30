import 'package:flutter/material.dart';
import 'package:patientapp/Views/GetStarted/getstarted_desktop.dart';
import 'package:patientapp/responsive/responsive_layout.dart';

import 'getstarted_mobile.dart';

class getstarted_main extends StatelessWidget {
  const getstarted_main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const responsive_layout(mobileBody: getstarted_mobile(), desktopBody: getstarted_desktop());
  }
}

