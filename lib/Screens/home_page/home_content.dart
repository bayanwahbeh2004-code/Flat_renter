import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Filter.dart';
import 'package:baytech/Screens/FilteringPage.dart';
import 'package:baytech/helper/build_grid.dart';
import 'package:baytech/providers/Filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String buttonSelected = 'All';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadHouses();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final filterProvider = Provider.of<FilterProvider>(context, listen: false);
    if (filterProvider.hasActiveFilter) {
      setState(() {
        buttonSelected = 'All';
      });
    }
  }

  Future<void> _loadHouses() async {
    try {
      final filterProvider = Provider.of<FilterProvider>(
        context,
        listen: false,
      );
      Filter filter;
      if (filterProvider.hasActiveFilter) {
        filter = filterProvider.filter;
      } else {
        // Use button-based filter
        filter = Filter(
          category: buttonSelected == 'All' ? null : buttonSelected,
        );
      }
      debugPrint('Loading houses with filter: ${filter.category}');
      await filterProvider.setFilter(filter, context);
    } catch (e) {
      print('Error loading houses: $e');
    }
  }

  void currentSelectedButton(String category) {
    final filterProvider = Provider.of<FilterProvider>(context, listen: false);
    if (filterProvider.hasActiveFilter) {
      filterProvider.clearFilter();
    }

    setState(() {
      buttonSelected = category;
    });

    _loadHouses();
  }

  void _applyFilterFromPage() {
    setState(() {
      buttonSelected = 'All';
    });
    _loadHouses();
  }

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);

    return Consumer<FilterProvider>(
      builder: (context, filterProviderConsumer, child) => ModalProgressHUD(
        inAsyncCall: filterProviderConsumer.isLoading,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    Filteringpage.id,
                  );
                  if (result == true) {
                    _applyFilterFromPage();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Koption,
                  ),
                  height: 50,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text('Search...'),
                      ),
                      if (filterProvider.hasActiveFilter)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: KPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Filtered',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),

                      const Spacer(),

                      Icon(Icons.search, color: Colors.grey[700]),
                      const SizedBox(width: 16),
                      Stack(
                        children: [
                          Icon(Icons.tune, color: Colors.grey[700]),
                          if (filterProvider.hasActiveFilter)
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  color: KPurple,
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 12,
                                  minHeight: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),
              if (filterProvider.hasActiveFilter)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            filterProvider.clearFilter();
                            _loadHouses();
                          },
                          icon: const Icon(Icons.clear, size: 16),
                          label: const Text('Clear Filters'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: KPurple,
                            side: const BorderSide(color: KPurple),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildMenuButton(
                      'All',
                      isSelected:
                          buttonSelected == 'All' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('All'),
                    ),
                    _buildMenuButton(
                      'Hotels',
                      isSelected:
                          buttonSelected == 'Hotels' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('Hotels'),
                    ),
                    _buildMenuButton(
                      'Rooms',
                      isSelected:
                          buttonSelected == 'Rooms' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('Rooms'),
                    ),
                    _buildMenuButton(
                      'Duplex',
                      isSelected:
                          buttonSelected == 'Duplex' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('Duplex'),
                    ),
                    _buildMenuButton(
                      'Villa',
                      isSelected:
                          buttonSelected == 'Villa' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('Villa'),
                    ),
                    _buildMenuButton(
                      'Suites',
                      isSelected:
                          buttonSelected == 'Suites' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('Suites'),
                    ),
                    _buildMenuButton(
                      'Apartment',
                      isSelected:
                          buttonSelected == 'Apartment' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('Apartment'),
                    ),
                    _buildMenuButton(
                      'House',
                      isSelected:
                          buttonSelected == 'House' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('House'),
                    ),
                    _buildMenuButton(
                      'Others',
                      isSelected:
                          buttonSelected == 'Others' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('Others'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              filterProviderConsumer.houses.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.home_work_outlined,
                            size: 64,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            filterProvider.hasActiveFilter
                                ? 'No houses found with the current filters'
                                : 'No houses found for "$buttonSelected"',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    )
                  : Container(
                      height: filterProviderConsumer.hasActiveFilter
                          ? 480
                          : 530,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: buildGrid(filterProviderConsumer.houses),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildMenuButton(
  String title, {
  bool isSelected = false,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Koption,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
}
