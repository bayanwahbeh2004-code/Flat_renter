import 'dart:io';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/edit_apartment_page.dart';
import 'package:baytech/Screens/etate_page/estate_page.dart';
import 'package:baytech/components/go_back_button.dart';
import 'package:baytech/components/heart_icon.dart';
import 'package:baytech/helper/File_from_url.dart';
import 'package:baytech/providers/my_houses_provider.dart';
import 'package:baytech/services/houses/deleting_houses/delete_house.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';

class ApartmentDetailsPage extends StatefulWidget {
  static const String id = 'apartment_details_page';
  Apartment? house;
  bool? isFavourite;
  ApartmentDetailsPage({this.house, this.isFavourite});

  @override
  State<ApartmentDetailsPage> createState() => _ApartmentDetailsPageState();
}

class _ApartmentDetailsPageState extends State<ApartmentDetailsPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    widget.house = ModalRoute.of(context)!.settings.arguments as Apartment;
    double screenWidth = MediaQuery.of(context).size.width;
    List<String> veiwList = [];
    veiwList.add(widget.house!.mainImage!);
    veiwList.addAll(widget.house!.images!);
    return Consumer<MyHousesProvider>(
      builder: (context, MyHousesProvider, child) => Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: ListView(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: GoBackButton(),
                  ),
                  Spacer(flex: 1),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      widget.house!.title!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(flex: 3),

                  HeartIconButton(
                    house: widget.house!,
                    isFavourite: widget.house!.isFavourite!,
                  ),
                  Spacer(flex: 1),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: GestureDetector(
                    onTap: () {
                      print(widget.house!.mine!);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotoViewGallery.builder(
                            itemCount: veiwList.length,
                            pageController: PageController(initialPage: 0),
                            scrollPhysics: const BouncingScrollPhysics(),
                            builder: (context, index) {
                              return PhotoViewGalleryPageOptions(
                                imageProvider: NetworkImage(
                                  KbaseUrlImage + veiwList[index],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    child: Image.network(
                      KbaseUrlImage + widget.house!.mainImage!,
                      height: 250,
                      width: screenWidth - 64,
                      fit: BoxFit.cover,
                    ),
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
                      widget.house!.governorate!,
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 30),
                    Icon(Icons.location_on_outlined, color: Colors.grey[700]),
                    const SizedBox(width: 5),
                    Text(
                      widget.house!.city!,
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
                    itemCount: widget.house!.images!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotoViewGallery.builder(
                                itemCount: veiwList.length,
                                pageController: PageController(
                                  initialPage: index + 1,
                                ),
                                scrollPhysics: const BouncingScrollPhysics(),
                                builder: (context, index) {
                                  return PhotoViewGalleryPageOptions(
                                    imageProvider: NetworkImage(
                                      KbaseUrlImage + veiwList[index],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              KbaseUrlImage + widget.house!.images![index],
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
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
                    widget.house!.bedrooms!.toString(),
                    "Bedrooms",
                  ),
                  _IconNorm(
                    Icons.bathtub_outlined,
                    widget.house!.bathrooms!.toString(),
                    "Bathrooms",
                  ),
                  _IconNorm(
                    Icons.apartment_outlined,
                    widget.house!.livingRooms!.toString(),
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
                    widget.house!.category!,
                    "Category",
                  ),
                  _IconNorm(
                    Icons.villa_outlined,
                    "${widget.house!.area}m²",
                    "Area",
                  ),
                  _IconNorm(
                    Icons.attach_money_outlined,
                    "${widget.house!.price} \$",
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
                  widget.house!.description!,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 30),
              (widget.house!.mine == true)
                  ? Padding(
                      padding: const EdgeInsets.only(
                        bottom: 48.0,
                        left: 72,
                        right: 64,
                      ),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text(
                                      'You are about to delete this house, are you sure?',
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text(
                                          'cancel',
                                          style: TextStyle(color: KPurple),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      TextButton(
                                        child: const Text(
                                          'ok',
                                          style: TextStyle(color: KPurple),
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          if (await deleteHouse(
                                                house: widget.house!,
                                                context: context,
                                              ) ==
                                              true) {
                                            MyHousesProvider.setMyHouses(
                                              context,
                                            );
                                            setState(() {
                                              isLoading = false;
                                            });
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }
                                          ;
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Delete",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 80),
                          ElevatedButton(
                            onPressed: () async {
                              List<File> images = [];
                              setState(() {
                                isLoading = true;
                              });
                              File mainImage = await fileFromImageUrl(
                                KbaseUrlImage + widget.house!.mainImage!,
                              );
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      EditApartmentPage(
                                        old_house: widget.house!,
                                        mainImage: mainImage,
                                      ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            child: const Text(
                              "Edit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(height: 40),
            ],
          ),
        ),
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
