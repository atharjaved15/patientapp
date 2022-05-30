import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:patientapp/Colors/colors.dart';
import 'package:patientapp/Views/Patient_Dashboard/patient_dashboard.dart';
import 'package:patientapp/Views/Signup/signup_mobile.dart';

class login_mobile extends StatefulWidget {
  const login_mobile({Key? key}) : super(key: key);

  @override
  State<login_mobile> createState() => _login_mobileState();
}

class _login_mobileState extends State<login_mobile> {
  @override
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

  Future<void> logIn(context) async {
    getValues();
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try{
      UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      String Uid;
      Uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot doc = await firebaseFirestore
          .collection('Users')
          .doc('$dropdownvalue')
          .collection('userDetails')
          .doc('$Uid')
          .get();
      if (user != null && doc.exists && doc['userRole'] == dropdownvalue) {
        Fluttertoast.showToast(msg: "Logged In Successfully");
        Navigator.push(context, MaterialPageRoute(builder: (context) => patient_dashboard()));
      } else {
        Fluttertoast.showToast(msg: 'You are not registered as $dropdownvalue');
      }
    }
    catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }



  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                'LOGIN',
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
              SizedBox(height: 25,),
              InkWell(
                  child: Text("SignUp Here" , style: TextStyle(color: main_color ),),
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => signup_mobile()));
                },
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: MaterialButton(
                  onPressed: () async{
                    await logIn(context);
                  },
                  height: MediaQuery.of(context).size.height * 0.08,
                  minWidth: MediaQuery.of(context).size.width *0.9,
                  color: main_color,
                  child: Center(
                    child: Text('Log In', style: TextStyle(color: Colors.white),),
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
