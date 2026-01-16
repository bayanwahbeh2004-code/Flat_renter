import 'dart:io';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Theme/theme_proider.dart';
import 'package:baytech/components/adding_custom_text_field.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/custom_drop_down_button.dart';
import 'package:baytech/components/go_back_button.dart';
import 'package:baytech/components/upload_image.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:baytech/helper/build_drop_down_list.dart';
import 'package:baytech/providers/my_houses_provider.dart';
import 'package:baytech/services/houses/adding_houses/store_house.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class AddAppartmentPage extends StatefulWidget {
  static String id = "Add apartment page";

  const AddAppartmentPage({Key? key}) : super(key: key);

  @override
  State<AddAppartmentPage> createState() => _AddAppartmentPageState();
}

class _AddAppartmentPageState extends State<AddAppartmentPage> {
  late Apartment apartment;
  File? mainImage;
  late List<File?> images;
  String? category; // Keep this for the selected category
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
    return Consumer<MyHousesProvider>(
      builder: (context, myHousesProvider, child) => ModalProgressHUD(
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
                        hintText: S.of(context).apartment_title_hint,
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
                      light: Theme.of(context).brightness == Brightness.light,
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
                    child: CityGovernorate(
                      onChanged: (gov, city) {
                        apartment.city = city;
                        apartment.governorate = gov;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      S.of(context).property_photos,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
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
                            light:
                                Theme.of(context).brightness ==
                                Brightness.light,
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
                      S.of(context).property_details,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
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
                            hintText: S.of(context).bedrooms_hint,
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
                            hintText: S.of(context).bathrooms_hint,
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
                            hintText: S.of(context).living_rooms_hint,
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
                          CustomDropDownButton(
                            value: category,
                            onChanged: (item) {
                              setState(() {
                                category = item;
                              });
                              apartment.category = item;
                            },
                            hintText: S.of(context).category_hint,
                            dropDownValues: [
                              "Hotel",
                              "Room",
                              "Duplex",
                              "Villa",
                              "Suite",
                              "Apartment",
                              "House",
                              "Others"
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Icon(Icons.villa_outlined, size: 40),
                          AddingCustomTextField(
                            textInputType: TextInputType.number,
                            onchanged: (data) {
                              apartment.area = data;
                            },
                            width: 80,
                            hintText: S.of(context).area_hint,
                            controller: areaController,
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
                            hintText: S.of(context).price_hint,
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
                        hintText: S.of(context).description_hint,
                        controller: descriptionController,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: CostumButton(
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      buttonColor: Theme.of(context).colorScheme.primary,
                      text: S.of(context).post_button,
                      onTap: () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }

                        // Validate required fields
                        if (mainImage == null) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(S.of(context).error_title),
                              content: Text(S.of(context).select_main_image),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(S.of(context).ok),
                                ),
                              ],
                            ),
                          );
                          return;
                        }

                        if (category == null) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(S.of(context).error_title),
                              content: Text(S.of(context).select_category),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(S.of(context).ok),
                                ),
                              ],
                            ),
                          );
                          return;
                        }

                        // Prepare data
                        apartment.mainImage = mainImage!.path;
                        apartment.category = category; // Use the category value

                        List<String> pics = [];
                        for (int i = 0; i < 6; i++) {
                          if (images[i] != null) {
                            pics.add(images[i]!.path);
                          }
                        }
                        setState(() {
                          isLoading = true;
                        });
                        bool ok = await storeHouse(
                          house: apartment,
                          images: pics,
                          context: context,
                        );
                        setState(() {
                          isLoading = false;
                        });
                        if (ok) {
                          myHousesProvider.setMyHouses(context);
                          Navigator.pop(context);
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
      ),
    );
  }
}
