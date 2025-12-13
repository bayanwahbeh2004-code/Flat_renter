import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';

Widget _buildminuRep(
  String title, {
  bool isSelected = false,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Koption,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Koption,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search..',
                      border: InputBorder.none,

                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 68, 68, 68),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.tune,
                    color: Color.fromARGB(255, 84, 83, 83),
                  ),
                  onPressed: () {
                    //  الفلترة
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildminuRep('All', isSelected: true),
                _buildminuRep('Hotels'),
                _buildminuRep('Rooms'),
                _buildminuRep('Duplex'),
                _buildminuRep('Villa'),
                _buildminuRep('Suites'),
                _buildminuRep('Apartment'),
                _buildminuRep('House'),
                _buildminuRep('Others'),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Center(
            child: Text(
              'Images',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          //الشقق يلي بدها تنحط
        ],
      ),
    );
  }
}
