import 'package:baytech/Models/Filter.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:baytech/components/custom_drop_down_button.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:baytech/helper/build_drop_down_list.dart';
import 'package:baytech/providers/Filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filteringpage extends StatefulWidget {
  static String id = "Filtering_Page";

  @override
  State<Filteringpage> createState() => _FilteringpageState();
}

class _FilteringpageState extends State<Filteringpage> {
  final Filter filter = Filter();
  String? order;

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (context, filterProvider, child) => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: CityGovernorate(
                        onChanged: (gov, city) {
                          filter.city = city;
                          filter.governorate = gov;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: CustomDropDownButton(
                        value: order,
                        onChanged: (item) {
                          setState(() {
                            order = item;
                            filter.rating_order = item == '' ? 'asc' : 'desc';
                          });
                        },
                        hintText: ' reputation-based filter',
                        dropDownValues: ['Descending order', 'Ascending order'],
                      ),
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 40),
                                Text(
                                  S.of(context).price_label.toString(),
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                ),
                                SizedBox(height: 70),
                                Text(
                                  S.of(context).area_label.toString(),
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                ),
                                SizedBox(height: 70),
                                Text(
                                  S.of(context).bathrooms_label.toString(),
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                ),
                                SizedBox(height: 70),
                                Text(
                                  S.of(context).livingrooms_label.toString(),
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                ),
                                SizedBox(height: 70),
                                Text(
                                  S.of(context).bedrooms_label.toString(),
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                ),
                                SizedBox(height: 70),
                                Text(
                                  S.of(context).description_hint.toString(),
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                ),
                                SizedBox(height: 70),
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
                                        hintText: S
                                            .of(context)
                                            .min_hint
                                            .toString(),
                                        onchanged: (minPrice) {
                                          filter.minPrice = minPrice;
                                        },
                                        textInputType: TextInputType.number,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: CostumTextFeild(
                                        hintText: S
                                            .of(context)
                                            .max_hint
                                            .toString(),
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
                                        hintText: S
                                            .of(context)
                                            .min_hint
                                            .toString(),
                                        onchanged: (minarea) {
                                          filter.minarea = minarea;
                                        },
                                        textInputType: TextInputType.number,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: CostumTextFeild(
                                        hintText: S
                                            .of(context)
                                            .max_hint
                                            .toString(),
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
                                        hintText: S
                                            .of(context)
                                            .min_hint
                                            .toString(),
                                        onchanged: (minBathroom) {
                                          filter.minBathroom = minBathroom;
                                        },
                                        textInputType: TextInputType.number,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: CostumTextFeild(
                                        hintText: S
                                            .of(context)
                                            .max_hint
                                            .toString(),
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
                                        hintText: S
                                            .of(context)
                                            .min_hint
                                            .toString(),
                                        onchanged: (minLivingRoom) {
                                          filter.minLivingRoom = minLivingRoom;
                                        },
                                        textInputType: TextInputType.number,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: CostumTextFeild(
                                        hintText: S
                                            .of(context)
                                            .max_hint
                                            .toString(),
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
                                        hintText: S
                                            .of(context)
                                            .min_hint
                                            .toString(),
                                        onchanged: (minBedroom) {
                                          filter.minBedroom = minBedroom;
                                        },
                                        textInputType: TextInputType.number,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: CostumTextFeild(
                                        hintText: S
                                            .of(context)
                                            .max_hint
                                            .toString(),
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
                                  hintText: S
                                      .of(context)
                                      .description_hint
                                      .toString(),
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
                text: S.of(context).search_button.toString(),
                onTap: () async {
                  filterProvider.clearFilter();
                  await filterProvider.setFilter(filter, context);
                  Navigator.pop(context);
                },
                textColor: Theme.of(context).colorScheme.onPrimary,
                buttonColor: Theme.of(context).colorScheme.primary,
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
