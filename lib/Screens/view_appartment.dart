import 'package:baytech/components/go_back_button.dart';
import 'package:flutter/material.dart';

class ApartmentDetailsPage extends StatelessWidget {
  static const String id = 'apartment_details_page';

  final List<String> detailImages = [
    'assets/images/childrenBedroom.png',
    'assets/images/room1.png',
    'assets/images/adultBedroom.png',
    'assets/images/library.png',
  ];

  ApartmentDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GoBackButton(),
              ),
              const SizedBox(width: 50),
              Expanded(
                child: Text(
                  "Dream house",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/images/house.png',
                height: 250,
                width: screenWidth - 64,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.grey[700]),
                const SizedBox(width: 5),
                Text(
                  "Damascus",
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
                const SizedBox(width: 30),
                Icon(Icons.location_on_outlined, color: Colors.grey[700]),
                const SizedBox(width: 5),
                Text(
                  "Almalki",
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: Text(
              "Property Photos",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: detailImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        detailImages[index],
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: Text(
              "Property details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _IconNorm(Icons.bed_outlined, '3', "Bedrooms"),
              _IconNorm(Icons.bathtub_outlined, '2', "Bathrooms"),
              _IconNorm(Icons.apartment_outlined, '1', "Living Rooms"),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _IconNorm(Icons.question_mark_outlined, "home", "Category"),
              _IconNorm(Icons.villa_outlined, "180 m²", "Area"),
              _IconNorm(Icons.attach_money_outlined, "250 \$", "Price / Day"),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Iconpress(Icons.chat_outlined, "contact", () {}),
              _Iconpress(Icons.location_on_outlined, "location", () {}),
              _Iconpress(Icons.star_border, "Reviews", () {}),
            ],
          ),

          const SizedBox(height: 60),
          const Padding(
            padding: EdgeInsets.only(left: 32.0, bottom: 8.0),
            child: Text(
              "Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "amazing apartment and Perfect for long-term stays or quick getaways.",
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Book Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

Widget _IconNorm(IconData icon, String value, String iconName) {
  return Column(
    children: [
      Icon(icon, size: 40, color: Colors.black),
      const SizedBox(height: 5),
      Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      Text(iconName, style: TextStyle(fontSize: 14, color: Colors.grey)),
      const SizedBox(height: 5),
    ],
  );
}

Widget _Iconpress(IconData icon, String label, VoidCallback onPressed) {
  return Column(
    children: [
      IconButton(
        icon: Icon(icon),
        iconSize: 40,
        color: Colors.black,
        onPressed: onPressed,
      ),
      Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
    ],
  );
}
