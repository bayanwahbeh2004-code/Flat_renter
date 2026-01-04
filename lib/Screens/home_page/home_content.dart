import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Filter.dart';
import 'package:baytech/Screens/FilteringPage.dart';
import 'package:baytech/generated/l10n.dart';
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
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  height: 50,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          S.of(context).search_hint,
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                      if (filterProvider.hasActiveFilter)
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            S.of(context).filtered_badge,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ),

                      const Spacer(),

                      Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(width: 16),
                      Stack(
                        children: [
                          Icon(
                            Icons.tune,
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                          ),
                          if (filterProvider.hasActiveFilter)
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
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
                          label: Text(S.of(context).clear_filters),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
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
                      context,
                      S.of(context).all_category,
                      isSelected:
                          buttonSelected == 'All' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('All'),
                    ),
                    _buildMenuButton(
                      context,
                      S.of(context).hotel,
                      isSelected:
                          buttonSelected == 'Hotel' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('Hotel'),
                    ),
                    _buildMenuButton(
                      context,
                      S.of(context).room,
                      isSelected:
                          buttonSelected == 'Room' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('Room'),
                    ),
                    _buildMenuButton(
                      context,
                      S.of(context).duplex,
                      isSelected:
                          buttonSelected == 'Duplex' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('Duplex'),
                    ),
                    _buildMenuButton(
                      context,
                      S.of(context).villa,
                      isSelected:
                          buttonSelected == 'Villa' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('Villa'),
                    ),
                    _buildMenuButton(
                      context,
                      S.of(context).suite,
                      isSelected:
                          buttonSelected == 'Suite' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('Suite'),
                    ),
                    _buildMenuButton(
                      context,
                      S.of(context).apartment,
                      isSelected:
                          buttonSelected == 'Apartment' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('Apartment'),
                    ),
                    _buildMenuButton(
                      context,
                      S.of(context).house,
                      isSelected:
                          buttonSelected == 'House' &&
                          !filterProvider.hasActiveFilter,
                      onTap: () => currentSelectedButton('House'),
                    ),
                    _buildMenuButton(
                      context,
                      S.of(context).others,
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
                          Icon(
                            Icons.home_work_outlined,
                            size: 64,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            filterProvider.hasActiveFilter
                                ? S.of(context).no_houses_filter
                                : "${S.of(context).no_houses_category} $buttonSelected",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onSurface,
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
                        child: buildGrid(filterProviderConsumer.houses, false),
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
  BuildContext context,
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
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
}
