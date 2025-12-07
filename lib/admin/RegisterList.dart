import 'package:baytech/Models/Register_request.dart';
import 'package:baytech/admin/RequestWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Registerlist extends StatefulWidget {
  Registerlist({super.key, required this.Request});
  List<RegisterRequest> Request;

  @override
  State<Registerlist> createState() => _RegisterlistState();
}

class _RegisterlistState extends State<Registerlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: ListView(children: RequestList(widget.Request)),
    );
  }
}

List<Widget> RequestList(List<RegisterRequest> Request) {
  List<Widget> Register = [];
  for (int i = 0; i < Request.length; i++) {
    Register.add(Requestwidget(request: Request[i]));
  }
  return Register;
}
