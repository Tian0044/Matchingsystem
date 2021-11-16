import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:telemedicine_app_main/database/data.dart';


///配对医生  测试页面
class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestPage();
  }
}

class TestPage extends State<Test> {
  final myController = TextEditingController();
  List<Doctor> doctors;

  findDoctor(String diseas) {
    setState(() {
      var doctorManager = DoctorManager();
      doctors = doctorManager.findDoctor(diseas);
      print("searching result${doctors.length}");
    });
  }

  @override
  void initState() {
    super.initState();
    runZoned(() {
      DeparmentModel();
      DoctorModel();
    }, onError: (dynamic e, StackTrace stack) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Outpatient appointment"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(),
                      controller: myController,
                    ),
                    flex: 1,
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // fixedSize: Size(300, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                      onPressed: () {
                        var text = myController.text.toString();
                        print("输入内容=${text}");
                        findDoctor(text);
                      },
                      child: const Text('search'),
                    ),
                  )
                ],
              )),
          Expanded(
            child: doctors == null
                ? Container()
                : doctors.length == 0
                    ? Center(
                        child: Text("No matching doctor found"),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 90,
                            margin: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(doctors[index].avatar.toString()),
                                  backgroundColor: Colors.grey,
                                  radius: 60,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doctors[index].name,
                                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      doctors[index].address,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      doctors[index].department,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      doctors[index].phone,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      doctors[index].email,
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                // Expanded(
                                //   child: Container(),
                                //   flex: 1,
                                // ),
                                // SizedBox(
                                //   width: 90,
                                //   child: ElevatedButton(
                                //     style: ElevatedButton.styleFrom(
                                //         // fixedSize: Size(300, 50),
                                //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                                //     onPressed: () {
                                //       Fluttertoast.showToast(
                                //         msg: "预约成功",
                                //         toastLength: Toast.LENGTH_SHORT,
                                //         gravity: ToastGravity.CENTER,
                                //         timeInSecForIosWeb: 1,
                                //         backgroundColor: Colors.black45,
                                //         textColor: Colors.white,
                                //       );
                                //     },
                                //     child: const Text('预约'),
                                //   ),
                                // )
                              ],
                            ),
                          );
                        },
                        itemCount: doctors.length,
                      ),
            flex: 1,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }
}
