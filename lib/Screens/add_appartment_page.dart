import 'dart:io';

import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Location.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/components/adding_custom_text_field.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/custom_drop_down_button.dart';
import 'package:baytech/components/go_back_button.dart';
import 'package:baytech/components/upload_image.dart';
import 'package:baytech/helper/build_drop_down_list.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:baytech/services/houses/adding_houses/add_house.dart';
import 'package:baytech/services/houses/adding_houses/add_images.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
  bool isLoading = false;
  // Controllers
  late TextEditingController titleController;
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
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Container(
            child: ListView(
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    GoBackButton(),
                    SizedBox(width: 70),
                    AddingCustomTextField(
                      width: 250,
                      hintText: "apartment title..",
                      controller: titleController,
                      onchanged: (data) {
                        apartment.title = data;
                      },
                    ),
                  ],
                ),
                SizedBox(height: 40),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CityGovernorate(),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text(
                    "Property Photos",
                    style: TextStyle(fontSize: 20),
                  ),
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
                  child: Text(
                    "Property details",
                    style: TextStyle(fontSize: 20),
                  ),
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
                          onchanged: (data) {
                            apartment.bedrooms = data;
                          },
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
                          onchanged: (data) {
                            apartment.bathrooms = data;
                          },
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
                          onchanged: (data) {
                            apartment.livingRooms = data;
                          },
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
                          hintText: 'category',
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
                            onchanged: (data) {
                              apartment.area = data;
                            },
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
                          onchanged: (data) {
                            apartment.price = data;
                          },
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
                      onchanged: (data) {
                        apartment.description = data;
                      },
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
                    onTap: () async {
                      List<String> pics = [];
                      for (int i = 0; i < 6; i++) {
                        if (images[i] != null) {
                          pics.add(images[i]!.path);
                        }
                      }
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        await addHouse(context: context, house: apartment);
                        await addImages(
                          house: apartment,
                          images: pics,
                          context: context,
                        );
                        setState(() {
                          isLoading = false;
                        });
                      }
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
      ),
    );
  }
}
