import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/estate_page.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/go_back_button.dart';
import 'package:baytech/components/heart_icon.dart';
import 'package:baytech/helper/show_to_do_something_dialoge.dart';
import 'package:baytech/services/houses/deleting_houses/delete_house.dart';
import 'package:baytech/services/houses/deleting_houses/delete_image.dart';
import 'package:flutter/material.dart';

class ApartmentDetailsPage extends StatelessWidget {
  static const String id = 'apartment_details_page';
  Apartment? house;
  bool? isFavourite;
  ApartmentDetailsPage({this.house, this.isFavourite});
  @override
  Widget build(BuildContext context) {
    house = ModalRoute.of(context)!.settings.arguments as Apartment;
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

              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Text(
                  house!.title!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              house!.isFavourite != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 72.0),
                      child: HeartIconButton(
                        house: house!,
                        isFavourite: house!.isFavourite!,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CostumButton(
                            buttonColor: Colors.white,
                            text: 'Edit',
                            textColor: Colors.black,
                            height: 40,
                            width: 80,
                            onTap: () {
                              // Navigator.pushNamed(context, editPage.id);
                            },
                          ),
                          SizedBox(height: 10),
                          CostumButton(
                            buttonColor: Colors.red,
                            text: 'Delete',
                            textColor: Colors.white,
                            height: 40,
                            width: 80,
                            onTap: () async {
                              showToDoSomeThingDialoge(
                                context,
                                message:
                                    'you are about to delete this house from your profile, are you sure?',
                                toDo: deleteImages(
                                  context: context,
                                  house: house!,
                                ),
                                toDo2: deleteHouse(
                                  context: context,
                                  house: house!,
                                ),
                                whereTo: YourEstatesPage.id,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                KbaseUrlImage + house!.mainImage!,
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
                  house!.location!.governorate!,
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
                const SizedBox(width: 30),
                Icon(Icons.location_on_outlined, color: Colors.grey[700]),
                const SizedBox(width: 5),
                Text(
                  house!.location!.city!,
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
                itemCount: house!.images!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        KbaseUrlImage + house!.images![index],
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
              _IconNorm(
                Icons.bed_outlined,
                house!.bedrooms!.toString(),
                "Bedrooms",
              ),
              _IconNorm(
                Icons.bathtub_outlined,
                house!.bathrooms!.toString(),
                "Bathrooms",
              ),
              _IconNorm(
                Icons.apartment_outlined,
                house!.livingRooms!.toString(),
                "Living Rooms",
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _IconNorm(
                Icons.question_mark_outlined,
                house!.category!,
                "Category",
              ),
              _IconNorm(Icons.villa_outlined, "${house!.area}m²", "Area"),
              _IconNorm(
                Icons.attach_money_outlined,
                "${house!.price} \$",
                "Price a Day",
              ),
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

          const SizedBox(height: 40),
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
              house!.description!,
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
