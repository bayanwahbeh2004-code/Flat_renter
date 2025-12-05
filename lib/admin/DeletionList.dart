import 'package:baytech/Models/Register_request.dart';
import 'package:baytech/admin/RequestWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Deletionlist extends StatefulWidget {
  Deletionlist({super.key,required this.Request});
  List<RegisterRequest> Request;

  @override
  State<Deletionlist> createState() => _DeletionlistState();
}

class _DeletionlistState extends State<Deletionlist> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: width * 0.8,
                    height: height * 0.88,
                    child: ListView(children: RequestList(widget.Request)),
                  );
  }
}
List<Widget> RequestList(List<RegisterRequest> Request) {
  List<Widget> Deletion= [];
  for (int i = 0; i < Request.length; i++) {
    Deletion.add(Requestwidget(request:  Request[i]));
  }
  return Deletion;
}