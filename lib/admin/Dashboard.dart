import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          Container(width: width * 0.2),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(child: Row(children: [
                  
                ],)),
              Container(
                color: Color.fromARGB(255, 255, 255, 255),
                width: width * 0.8,
                height: height * 0.88,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
