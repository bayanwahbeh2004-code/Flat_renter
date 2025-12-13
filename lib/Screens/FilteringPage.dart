import 'package:baytech/Models/Filter.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:flutter/material.dart';

class Filteringpage extends StatefulWidget {
  static String id = "Filtering_Page";

  const Filteringpage({Key? key}) : super(key: key);

  @override
  State<Filteringpage> createState() => _FilteringpageState();
}

class _FilteringpageState extends State<Filteringpage> {
  Filter filter = Filter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SizedBox(height: 16),
                        Text("City:"),
                        SizedBox(height: 42),
                        Text("Governorate:"),
                        SizedBox(height: 42),
                        Text("Price:"),
                        SizedBox(height: 42),
                        Text("Area:"),
                        SizedBox(height: 42),
                        Text("Bathroom:"),
                        SizedBox(height: 42),
                        Text("LivingRoom:"),
                        SizedBox(height: 42),
                        Text("Bedroom:"),
                        SizedBox(height: 1),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: [
                          CostumTextFeild(
                            hintText: "",
                            onchanged: (city) {
                              filter.city = city;
                            },
                          ),
                          const SizedBox(height: 10),
                          CostumTextFeild(
                            hintText: "",
                            onchanged: (governorate) {
                              filter.governorate = governorate;
                            },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: CostumTextFeild(
                                  hintText: "Min",
                                  onchanged: (minPrice) {
                                    filter.minPrice = minPrice;
                                  },
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CostumTextFeild(
                                  hintText: "Max",
                                  onchanged: (maxPrice) {
                                    filter.maxPrice = maxPrice;
                                  },
                                  textInputType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: CostumTextFeild(
                                  hintText: "Min",
                                  onchanged: (minarea) {
                                    filter.minarea = minarea;
                                  },
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CostumTextFeild(
                                  hintText: "Max",
                                  onchanged: (maxarea) {
                                    filter.maxarea = maxarea;
                                  },
                                  textInputType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: CostumTextFeild(
                                  hintText: "Min",
                                  onchanged: (minBathroom) {
                                    filter.minBathroom = minBathroom;
                                  },
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CostumTextFeild(
                                  hintText: "Max",
                                  onchanged: (maxBathroom) {
                                    filter.maxBathroom = maxBathroom;
                                  },
                                  textInputType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: CostumTextFeild(
                                  hintText: "Min",
                                  onchanged: (minLivingRoom) {
                                    filter.minLivingRoom = minLivingRoom;
                                  },
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CostumTextFeild(
                                  hintText: "Max",
                                  onchanged: (maxLivingRoom) {
                                    filter.maxLivingRoom = maxLivingRoom;
                                  },
                                  textInputType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: CostumTextFeild(
                                  hintText: "Min",
                                  onchanged: (minBedroom) {
                                    filter.minBedroom = minBedroom;
                                  },
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CostumTextFeild(
                                  hintText: "Max",
                                  onchanged: (maxBedroom) {
                                    filter.maxBedroom = maxBedroom;
                                  },
                                  textInputType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            CostumButton(
              text: "Ok",
              onTap: () {},
              textColor: Colors.white,
              buttonColor: Colors.black,
              height: 40,
              width: 60,
            ),
          ],
        ),
      ),
    );
  }
}
