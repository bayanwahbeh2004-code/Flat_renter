import 'package:baytech/Models/Filter.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:baytech/helper/build_drop_down_list.dart';
import 'package:baytech/providers/Filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filteringpage extends StatelessWidget {
  static String id = "Filtering_Page";
  final Filter filter = Filter();
  CityGovernorate? location;

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (context, filterProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Filter"),
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    location = CityGovernorate(),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(height: 40),
                                Text("Price:"),
                                SizedBox(height: 70),
                                Text("Area:"),
                                SizedBox(height: 70),
                                Text("Bathrooms:"),
                                SizedBox(height: 70),
                                Text("Livingrooms:"),
                                SizedBox(height: 70),
                                Text("Bedrooms:"),
                                SizedBox(height: 70),
                                Text("description:"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
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
                                const SizedBox(height: 25),

                                // Area Row
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
                                const SizedBox(height: 25),

                                // Bathrooms Row
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
                                const SizedBox(height: 35),

                                // Livingrooms Row
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
                                const SizedBox(height: 35),

                                // Bedrooms Row
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
                                const SizedBox(height: 30),
                                CostumTextFeild(
                                  hintText: "description",
                                  onchanged: (description) {
                                    filter.description = description;
                                  },
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CostumButton(
                text: "search",
                onTap: () async {
                  filterProvider.clearFilter();
                //  print(location!.governorate);
                  filter.city = location!.city;
                  filter.governorate = location!.governorate;
                  await filterProvider.setFilter(filter, context);
                  Navigator.pop(context);
                },
                textColor: Colors.white,
                buttonColor: Colors.black,
                height: 60,
                width: 300,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
