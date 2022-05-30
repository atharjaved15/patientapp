import 'dart:html';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:patientapp/Views/Login/login_mobile.dart';
import 'package:patientapp/Views/Patient_Dashboard/patient_dashboard.dart';
import 'package:responsive_framework/utils/responsive_utils.dart';

import '../../Colors/colors.dart';

class signup_mobile extends StatefulWidget {
  const signup_mobile({Key? key}) : super(key: key);

  @override
  State<signup_mobile> createState() => _signup_mobileState();
}

class _signup_mobileState extends State<signup_mobile> {
  String dropdownvalue = 'Doctor';
  var items = [
    'Doctor',
    'Patient',
    'Laboratory Expert',
  ];
  late String name,email,pass;
  TextEditingController nameController= new TextEditingController();

  TextEditingController emailController = new TextEditingController();

  TextEditingController passController = new TextEditingController();

  getValues(){
    name = nameController.text.toString();
    email = emailController.text.toString();
    pass = passController.text.toString();
  }

  Future<void> signUp () async {
      if(name.isNotEmpty && email.isNotEmpty && pass.isNotEmpty){
       if(defaultTargetPlatform == TargetPlatform.android){
         await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
         await FirebaseFirestore.instance.collection('Users').doc('$dropdownvalue').collection('userDetails').doc(FirebaseAuth.instance.currentUser!.uid).set(
             {
               'userName' : name,
               'userEmail' : email,
               'userPass' : pass,
               'userRole' : dropdownvalue,
             }).whenComplete(() => {
           Fluttertoast.showToast(msg: 'Signed Up Successfully!!'),
           Navigator.push(context, MaterialPageRoute(builder: (context) => patient_dashboard())),
         });
       }
       }
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Image.asset(
                  'images/logo.png',
                  height: 100,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 40, fontWeight: FontWeight.bold, color: main_color),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: main_color,
                      ),
                      hintText: 'Enter Your Email Here',
                      label: const Text("Email"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: main_color,
                      ),
                      hintText: 'Enter Your Name Here',
                      label: const Text("Name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextFormField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: main_color,
                      ),
                      hintText: 'Enter Your Password Here',
                      label: const Text("Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 200.0),
                child: DropdownButton(
                  hint: Text('Sign In As'),
                  dropdownColor: Colors.white,
                  icon: Icon(
                    Icons.arrow_drop_down,
                  ),
                  isExpanded: true,
                  value: dropdownvalue,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownvalue = newValue.toString();
                    });
                  },
                  items: items.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                child: Text("SignIn Here" , style: TextStyle(color: main_color ),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => login_mobile()));
                },
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: MaterialButton(
                  onPressed: () async{
                    await getValues();
                    await signUp();
                  },
                  height: MediaQuery.of(context).size.height * 0.08,
                  minWidth: MediaQuery.of(context).size.width *0.9,
                  color: main_color,
                  child: Center(
                    child: Text('Sign Up', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
