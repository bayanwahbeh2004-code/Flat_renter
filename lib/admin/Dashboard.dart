import 'package:baytech/Constants.dart';
import 'package:baytech/admin/RegisterList.dart';
import 'package:baytech/admin/DeletionList.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:flutter/material.dart';
import 'package:baytech/admin/RequestWidget.dart';
import 'package:baytech/Models/Register_request.dart';

class Dashboard extends StatefulWidget {
  static String id = "Dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  bool showRegisterList = true;  

  final List<RegisterRequest> Register_Request = [
    RegisterRequest(birthday: "17/7/2005", firstName: "leen", secondName: "AhShughri", indentityCard: ".."),
    RegisterRequest(birthday: "17/7/2005", firstName: "leen", secondName: "AhShughri", indentityCard: ".."),
    RegisterRequest(birthday: "17/7/2005", firstName: "leen", secondName: "AhShughri", indentityCard: ".."),
    RegisterRequest(birthday: "17/7/2005", firstName: "leen", secondName: "AhShughri", indentityCard: ".."),
    RegisterRequest(birthday: "17/7/2005", firstName: "leen", secondName: "AhShughri", indentityCard: ".."),
    RegisterRequest(birthday: "17/7/2005", firstName: "leen", secondName: "AhShughri", indentityCard: ".."),
  ];

  final List<RegisterRequest> Deletion_Request = [
    RegisterRequest(birthday: "17/7/2005", firstName: "Sarah", secondName: "Sedekah", indentityCard: ".."),
    RegisterRequest(birthday: "17/7/2005", firstName: "Sarah", secondName: "Sedekah", indentityCard: ".."),
    RegisterRequest(birthday: "17/7/2005", firstName: "Sarah", secondName: "Sedekah", indentityCard: ".."),
    RegisterRequest(birthday: "17/7/2005", firstName: "Sarah", secondName: "Sedekah", indentityCard: ".."),
    RegisterRequest(birthday: "17/7/2005", firstName: "Sarah", secondName: "Sedekah", indentityCard: ".."),
    RegisterRequest(birthday: "17/7/2005", firstName: "Sarah", secondName: "Sedekah", indentityCard: ".."),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          Container(width: width * 0.2,
          child: Image.asset("assets/images/logo.png")),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height * 0.12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CostumButton(
                        text: 'Register Request',
                        textColor: Colors.black,
                        buttonColor: showRegisterList
                            ? KPurple
                            : Color.fromARGB(255, 239, 205, 255),
                        onTap: () {
                          setState(() {
                            showRegisterList = true;
                          });
                        },
                        height: 30,
                        width: 200,
                      ),
                      CostumButton(
                        text: 'Deletion Request',
                        textColor: Colors.black,
                        buttonColor: !showRegisterList
                            ? KPurple 
                            : Color.fromARGB(255, 239, 205, 255), 
                        onTap: () {
                          setState(() {
                            showRegisterList = false;
                          });
                        },
                        height: 30,
                        width: 200,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: showRegisterList
                      ? Registerlist(Request: Register_Request)
                      : Deletionlist(Request: Deletion_Request),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
