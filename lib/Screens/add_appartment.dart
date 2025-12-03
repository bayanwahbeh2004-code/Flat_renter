import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Location.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/components/adding_custom_text_field.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/custom_drop_down_button.dart';
import 'package:baytech/components/go_back_button.dart';
import 'package:baytech/components/upload_image.dart';
import 'package:baytech/helper/show_snack_bar.dart';
import 'package:flutter/material.dart';

class AddAppartment extends StatelessWidget {
  static String id = "Add apartment page";
  Apartment apartment = Apartment();
  Location location = Location();
  List<UploadImage> images = [];
  UploadImage? mainImage;
  CustomDropDownButton? category;
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 6; i++) {
      images.add(UploadImage(height: 150, width: 150));
    }
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          child: ListView(
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  GoBackButton(),
                  SizedBox(width: 50),
                  AddingCustomTextField(
                    width: 250,
                    hintText: "apartment title..",
                    onchanged: (data) {
                      apartment.title = data;
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: mainImage = UploadImage(height: 250, width: 250),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    AddingCustomTextField(
                      width: 190,
                      icon: Icons.location_on_outlined,
                      hintText: "town..",
                      onchanged: (data) {
                        location.town = data;
                      },
                    ),
                    AddingCustomTextField(
                      width: 190,
                      icon: Icons.location_on_outlined,
                      hintText: "city..",
                      onchanged: (data) {
                        location.city = data;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Text("Property Photos", style: TextStyle(fontSize: 20)),
              ),
              Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) => images[index],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Text("Property details", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Icon(Icons.bed_outlined, size: 40),
                      AddingCustomTextField(
                        width: 100,
                        hintText: "bedrooms",
                        onchanged: (data) {
                          apartment.bedrooms = data != ""
                              ? int.parse(data)
                              : null;
                        },
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Icon(Icons.bathtub_outlined, size: 40),

                      AddingCustomTextField(
                        width: 100,
                        hintText: "bathrooms",
                        onchanged: (data) {
                          apartment.bathrooms = data != ""
                              ? int.parse(data)
                              : null;
                        },
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.apartment_outlined, size: 40),
                      AddingCustomTextField(
                        width: 120,
                        hintText: "living rooms",
                        onchanged: (data) {
                          apartment.livingRooms = data != ""
                              ? int.parse(data)
                              : null;
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Icon(Icons.question_mark_outlined, size: 40),
                      category = CustomDropDownButton(),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Icon(Icons.villa_outlined, size: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 36.0),
                        child: AddingCustomTextField(
                          width: 80,
                          hintText: "area",
                          onchanged: (data) {
                            apartment.area = data != ""
                                ? double.parse(data)
                                : null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attach_money_outlined, size: 40),
                      AddingCustomTextField(
                        width: 120,
                        hintText: "price a day",
                        onchanged: (data) {
                          apartment.price = data != ""
                              ? double.parse(data)
                              : null;
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 48.0),
                  child: AddingCustomTextField(
                    icon: Icons.description_outlined,
                    width: 400,
                    hintText: "description..",
                    onchanged: (data) {
                      apartment.description = data;
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: CostumButton(
                  textColor: Colors.white,
                  buttonColor: Colors.black,
                  text: "Post",
                  onTap: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  height: 60,
                  width: 100,
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
