import 'package:baytech/components/book_card.dart';
import 'package:baytech/providers/myBookingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class BookingsPage extends StatefulWidget {
  static String id = "Booking Page";

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  String selectButton = 'current bookings';
  bool _isInitialLoad = true;

  void selectButNow(String category) {
    setState(() {
      selectButton = category;
    });
  }

  @override
  void initState() {
    super.initState();
    // Schedule loading after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadBookings();
    });
  }

  Future<void> _loadBookings() async {
    final bookings = Provider.of<BookingsProvider>(context, listen: false);
    await bookings.setBookings('current', context);
    if (mounted) {
      setState(() {
        _isInitialLoad = false;
      });
    }
  }

  Future<void> _onTabChanged(String status) async {
    final bookings = Provider.of<BookingsProvider>(context, listen: false);
    await bookings.setBookings(status, context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingsProvider>(
      builder: (context, bookings, child) {
        return ModalProgressHUD(
          inAsyncCall: bookings.isLoading,
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, left: 16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildminuRep(
                          context,
                          'current bookings',
                          isSelected: selectButton == 'current bookings',
                          onTap: () async {
                            selectButNow('current bookings');
                            await _onTabChanged('current');
                          },
                        ),
                        const SizedBox(width: 10),
                        _buildminuRep(
                          context,
                          'pending bookings',
                          isSelected: selectButton == 'pending bookings',
                          onTap: () async {
                            selectButNow('pending bookings');
                            await _onTabChanged('pending');
                          },
                        ),
                        const SizedBox(width: 10),
                        _buildminuRep(
                          context,
                          'cancelled bookings',
                          isSelected: selectButton == 'cancelled bookings',
                          onTap: () async {
                            selectButNow('cancelled bookings');
                            await _onTabChanged('cancelled');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16,
                      top: 16,
                      bottom: 8,
                    ),
                    child: _buildBookingsList(bookings),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBookingsList(BookingsProvider bookings) {
    if (_isInitialLoad && bookings.myBookings.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (bookings.myBookings.isEmpty) {
      return Center(
        child: Lottie.asset(
          "assets/animation/requests.json",
          width: 500,
          height: 700,
          repeat: true,
        ),
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: SizedBox(
            height: 130,
            child: BookCard(
              // FIXED: Use index instead of .first
              book: bookings.myBookings[index],
              isCurrent: selectButton == "current bookings",
            ),
          ),
        );
      },
      itemCount: bookings.myBookings.length,
    );
  }
}

Widget _buildminuRep(
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
          borderRadius: const BorderRadius.all(Radius.circular(20)),
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
