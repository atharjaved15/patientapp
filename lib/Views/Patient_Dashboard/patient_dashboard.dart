import 'package:flutter/material.dart';

class patient_dashboard extends StatelessWidget {
  const patient_dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(child: Text("Recent History" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green[900],
                        borderRadius: BorderRadius.circular(25),
                    ),
                      child: Center(child: Text("Doctors" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.pink[900],
                    borderRadius: BorderRadius.circular(25),
                ),
                  child: Center(child: Text("My Deceases" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
