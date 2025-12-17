import 'dart:io';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/etate_page/estate_page.dart';
import 'package:baytech/components/adding_custom_text_field.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/custom_drop_down_button.dart';
import 'package:baytech/components/go_back_button.dart';
import 'package:baytech/components/upload_image.dart';
import 'package:baytech/helper/build_drop_down_list.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:baytech/providers/my_houses_provider.dart';
import 'package:baytech/services/houses/update_house/update_house.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class EditApartmentPage extends StatefulWidget {
  static String id = "Edit apartment page";
  Apartment? old_house;
  File? mainImage;
  EditApartmentPage({this.old_house, this.mainImage});
  @override
  State<EditApartmentPage> createState() => _EditAppartmentPageState();
}

class _EditAppartmentPageState extends State<EditApartmentPage> {
  late Apartment apartment;
  late CityGovernorate location;
  String? category;
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
        child: Consumer<MyHousesProvider>(
          builder: (context, MyHousesProvider, child) => Scaffold(
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
                          hintText: widget.old_house!.title!,
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
                        image: widget.mainImage,
                        onPick: (file) {
                          setState(() {
                            widget.mainImage = file;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: location = CityGovernorate(
                        hintcity: widget.old_house!.city,
                        hintgov: widget.old_house!.governorate,
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
                          itemCount: widget.old_house!.images!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5.0,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  KbaseUrlImage +
                                      widget.old_house!.images![index],
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
                              hintText: widget.old_house!.bedrooms!,
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
                              hintText: widget.old_house!.bathrooms!,
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
                              hintText: widget.old_house!.livingRooms!,
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
                              hintText: '${widget.old_house!.category}',
                              dropDownValues: [
                                "Hotel",
                                "Room",
                                "Duplex",
                                "Villa",
                                "Suite",
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
                            AddingCustomTextField(
                              textInputType: TextInputType.number,
                              onchanged: (data) {
                                apartment.area = data;
                              },
                              width: 80,
                              hintText: widget.old_house!.area!,
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
                              hintText: widget.old_house!.price!,
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
                          hintText: widget.old_house!.description!,
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
                        text: "Update",
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          bool ok = await updateHouse(
                            old_house: widget.old_house!,
                            id: widget.old_house!.id!,
                            house: apartment,
                            mainImage: widget.mainImage!.path,
                            context: context,
                          );
                          setState(() {
                            isLoading = false;
                          });
                          if (ok) {
                            await MyHousesProvider.setMyHouses(context);
                            Navigator.pop(context);
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
      ),
    );
  }
}
