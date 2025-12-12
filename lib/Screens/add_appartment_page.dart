import 'dart:io';

import 'package:baytech/Models/Location.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/components/adding_custom_text_field.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/custom_drop_down_button.dart';
import 'package:baytech/components/go_back_button.dart';
import 'package:baytech/components/upload_image.dart';
import 'package:flutter/material.dart';

class AddAppartmentPage extends StatefulWidget {
  static String id = "Add apartment page";

  const AddAppartmentPage({Key? key}) : super(key: key);

  @override
  State<AddAppartmentPage> createState() => _AddAppartmentPageState();
}

class _AddAppartmentPageState extends State<AddAppartmentPage> {
  late Apartment apartment;
  late Location location;
  File? mainImage;
  late List<File?> images;
  CustomDropDownButton? category;

  // Controllers
  late TextEditingController titleController;
  late TextEditingController townController;
  late TextEditingController cityController;
  late TextEditingController bedroomsController;
  late TextEditingController bathroomsController;
  late TextEditingController livingRoomsController;
  late TextEditingController areaController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    apartment = Apartment();
    location = Location();
    formKey = GlobalKey<FormState>();
    _initializeControllers();
    _initializeImages();
  }

  void _initializeControllers() {
    titleController = TextEditingController();
    townController = TextEditingController();
    cityController = TextEditingController();
    bedroomsController = TextEditingController();
    bathroomsController = TextEditingController();
    livingRoomsController = TextEditingController();
    areaController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
    _setupControllerListeners();
  }

  void _setupControllerListeners() {
    titleController.addListener(() => apartment.title = titleController.text);
    townController.addListener(() => location.town = townController.text);
    cityController.addListener(() => location.city = cityController.text);
    bedroomsController.addListener(
      () => apartment.bedrooms = bedroomsController.text,
    );
    bathroomsController.addListener(
      () => apartment.bathrooms = bathroomsController.text,
    );
    livingRoomsController.addListener(
      () => apartment.livingRooms = livingRoomsController.text,
    );
    areaController.addListener(() => apartment.area = areaController.text);
    priceController.addListener(() => apartment.price = priceController.text);
    descriptionController.addListener(
      () => apartment.description = descriptionController.text,
    );
  }

  void _initializeImages() {
    mainImage = null;
    images = List.generate(6, (_) => null);
  }

  @override
  void dispose() {
    titleController.dispose();
    townController.dispose();
    cityController.dispose();
    bedroomsController.dispose();
    bathroomsController.dispose();
    livingRoomsController.dispose();
    areaController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    controller: titleController,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: UploadImage(
                  height: 250,
                  width: 250,
                  image: mainImage,
                  onPick: (file) {
                    setState(() {
                      mainImage = file;
                    });
                  },
                ),
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
                      controller: townController,
                    ),
                    AddingCustomTextField(
                      width: 190,
                      icon: Icons.location_on_outlined,
                      hintText: "city..",
                      controller: cityController,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Text("Property Photos", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return UploadImage(
                        height: 150,
                        width: 150,
                        image: images[index],
                        onPick: (file) {
                          setState(() {
                            images[index] = file;
                          });
                        },
                      );
                    },
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
                        textInputType: TextInputType.number,
                        width: 100,
                        hintText: "bedrooms",
                        controller: bedroomsController,
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Icon(Icons.bathtub_outlined, size: 40),

                      AddingCustomTextField(
                        textInputType: TextInputType.number,
                        width: 100,
                        hintText: "bathrooms",
                        controller: bathroomsController,
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.apartment_outlined, size: 40),
                      AddingCustomTextField(
                        textInputType: TextInputType.number,
                        width: 120,
                        hintText: "living rooms",
                        controller: livingRoomsController,
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
                      category = CustomDropDownButton(
                        selectedItem: 'category',
                        dropDownValues: [
                          "Hotels",
                          "Rooms",
                          "Duplex",
                          "Villa",
                          "Suites",
                          "Apartment",
                          "House",
                          "Others",
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Icon(Icons.villa_outlined, size: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 36.0),
                        child: AddingCustomTextField(
                          textInputType: TextInputType.number,
                          width: 80,
                          hintText: "area",
                          controller: areaController,
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
                        textInputType: TextInputType.number,
                        width: 120,
                        hintText: "price a day",
                        controller: priceController,
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
                    controller: descriptionController,
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
                  onTap: () {},
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
