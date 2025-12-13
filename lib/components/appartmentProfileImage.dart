import 'package:baytech/Models/apartment.dart';
import 'package:baytech/components/apartmentPicture.dart';
import 'package:flutter/material.dart';

class AppartmentProfileImage extends StatelessWidget {
  Apartment apartment;
  double width, height;
  AppartmentProfileImage({super.key, required this.height, required this.width,required this.apartment});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Apartmentpicture(height: 250, width: 250/*,apartment.mainImage*/),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/Kprofile.jpg",
            width: width,
            height: height,
          ),
          Positioned(
            child: Text(
              "Byan Home",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontFamily: "Platypi-VariableFont_wght.ttf",
                fontSize: 8,
              ),
            ),
            bottom: 25,
            left: 14,
          ),
          Positioned(
            child: Text(
              "Damascus,Syria",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontFamily: "Platypi-VariableFont_wght.ttf",
                fontSize: 8,
              ),
            ),
            bottom: 18,
            left: 19,
          ),
          Positioned(child: Icon(Icons.location_on,size: 10,color: const Color.fromARGB(255, 255, 255, 255),), bottom: 18, left: 10),
        ],
      ),
    );
  }
}
