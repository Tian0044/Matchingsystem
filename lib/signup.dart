import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine_app_main/testpage.dart';


class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Page"),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Test()));
          },
          label: Text("Go Back!"),
          icon: new Icon(Icons.ac_unit),
        ),
      ),
    ); //Scaffold
  }
}
