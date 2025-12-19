import 'dart:io';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/edit_apartment_page.dart';
import 'package:baytech/Screens/calendar_booking_page.dart';
import 'package:baytech/components/go_back_button.dart';
import 'package:baytech/components/heart_icon.dart';
import 'package:baytech/helper/File_from_url.dart';
import 'package:baytech/helper/RatedWidget.dart';
import 'package:baytech/providers/my_houses_provider.dart';
import 'package:baytech/services/houses/deleting_houses/delete_house.dart';
import 'package:baytech/services/houses/send_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
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
                    Icon(
                      Icons.location_on_outlined,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.house!.governorate!,
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Icon(
                      Icons.location_on_outlined,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.house!.city!,
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: Text(
                  "Property Photos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
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
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: Text(
                  "Property details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _IconNorm(
                    context,
                    Icons.bed_outlined,
                    widget.house!.bedrooms!.toString(),
                    "Bedrooms",
                  ),
                  _IconNorm(
                    context,
                    Icons.bathtub_outlined,
                    widget.house!.bathrooms!.toString(),
                    "Bathrooms",
                  ),
                  _IconNorm(
                    context,
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
                    context,
                    Icons.question_mark_outlined,
                    widget.house!.category!,
                    "Category",
                  ),
                  _IconNorm(
                    context,
                    Icons.villa_outlined,
                    "${widget.house!.area}m²",
                    "Area",
                  ),
                  _IconNorm(
                    context,
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
                  _Iconpress(context, Icons.chat_outlined, "contact", () {}),
                  _Iconpress(
                    context,
                    Icons.location_on_outlined,
                    "location",
                    () {},
                  ),
                  _Iconpress(
                    context,
                    Icons.star_border,
                    "Reviews",
                    () => showRatingDialog(context),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.only(left: 32.0, bottom: 8.0),
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  widget.house!.description!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.only(left: 32.0, bottom: 8.0),
                child: Text(
                  "House reputation:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Rated(currentRating: widget.house!.avg_star ?? '0'),
              (widget.house!.mine == true)
                  ? Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        bottom: 50,
                        left: 32,
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
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text(
                                          'cancel',
                                          style: TextStyle(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      TextButton(
                                        child: Text(
                                          'ok',
                                          style: TextStyle(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                          ),
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
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () async {
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
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            child: Text(
                              "Edit",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () async {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            child: Text(
                              "requests",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, calendar_book.id);
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 60),
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Book now',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void showRatingDialog(BuildContext context) {
    double currentRating = 0;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Rate this property",
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        content: RatingBar.builder(
          initialRating: 0,
          minRating: 0,
          allowHalfRating: false,
          itemCount: 5,
          itemSize: 32,
          itemBuilder: (context, _) =>
              Icon(Icons.star, color: Theme.of(context).colorScheme.secondary),
          onRatingUpdate: (rating) {
            currentRating = rating;
          },
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await sendRating(
                context: context,
                house: widget.house!,
                stars: currentRating.toString(),
              );
            },
            child: Text(
              "Ok",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _IconNorm(
  BuildContext context,
  IconData icon,
  String value,
  String iconName,
) {
  return Column(
    children: [
      Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
      const SizedBox(height: 5),
      Text(
        value,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      Text(
        iconName,
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      const SizedBox(height: 5),
    ],
  );
}

Widget _Iconpress(
  BuildContext context,
  icon,
  String label,
  VoidCallback onPressed,
) {
  return Column(
    children: [
      IconButton(
        icon: Icon(icon),
        iconSize: 40,
        color: Theme.of(context).colorScheme.primary,
        onPressed: onPressed,
      ),
      Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    ],
  );
}
