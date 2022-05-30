import 'package:flutter/material.dart';
class responsive_layout extends StatelessWidget {
  const responsive_layout({Key? key, required this.mobileBody, required this.desktopBody}) : super(key: key);
  final Widget mobileBody;
  final Widget desktopBody;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth<600){
        return mobileBody;
      }
        else{
          return desktopBody;
        }
      }
     );
  }
}
