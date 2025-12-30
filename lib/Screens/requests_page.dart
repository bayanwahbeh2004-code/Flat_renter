import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Models/book.dart';
import 'package:baytech/components/landLord_requests.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:baytech/providers/landLordRequestsProvider.dart';
import 'package:baytech/providers/myBookingsProvider.dart';
import 'package:baytech/services/houses/bookings/landlord/accept_booking.dart';
import 'package:baytech/services/houses/bookings/landlord/accept_update_request.dart';
import 'package:baytech/services/houses/bookings/landlord/book_requests.dart';
import 'package:baytech/services/houses/bookings/landlord/rejectUpdateRequests.dart';
import 'package:baytech/services/houses/bookings/landlord/reject_booking.dart';
import 'package:baytech/services/houses/bookings/landlord/update_requests.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class RequestsPage extends StatefulWidget {
  static String id = "Requests Page";
  Apartment? house;
  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  String selectButton = 'House booking requests';
  void selectButNow(String category) {
    setState(() {
      selectButton = category;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadrequests();
    });
  }

  Future<void> loadrequests() async {
    final provider = Provider.of<landLordRequestsProvider>(
      context,
      listen: false,
    );
    await provider.setBookings(widget.house!, context);
    await provider.setUpdate(widget.house!, context);
  }

  @override
  Widget build(BuildContext context) {
    widget.house = ModalRoute.of(context)!.settings.arguments as Apartment;
    return Consumer<landLordRequestsProvider>(
      builder: (context, requests, child) => ModalProgressHUD(
        inAsyncCall: requests.isLoading,
        child: Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0, left: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      _buildminuRep(
                        context,
                        S.of(context).house_booking_requests,
                        isSelected: selectButton == 'House booking requests',
                        onTap: () async {
                          selectButNow('House booking requests');
                          requests.setBookings(widget.house!, context);
                        },
                      ),
                      const SizedBox(width: 15),
                      _buildminuRep(
                        context,
                        S.of(context).update_booking_requests,
                        isSelected: selectButton == 'Update booking requests',
                        onTap: () async {
                          selectButNow('Update booking requests');
                          requests.setUpdate(widget.house!, context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16,
                  top: 16,
                  bottom: 8,
                ),
                child: Container(
                  height: 650,
                  child: selectButton == "House booking requests"
                      ? requests.bookingRequests.length != 0
                            ? ListView.builder(
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: 130,
                                    child: landLordRequestsCard(
                                      accept: () async {
                                        await acceptBooking(
                                          context: context,
                                          book: requests.bookingRequests[index],
                                        );
                                      },
                                      reject: () async {
                                        await rejectBooking(
                                          context: context,
                                          book: requests.bookingRequests[index],
                                        );
                                      },
                                      book: requests.bookingRequests[index],
                                    ),
                                  );
                                },
                                itemCount: requests.bookingRequests.length,
                              )
                            : Center(
                                child: Lottie.asset(
                                  "assets/animation/requests.json",
                                  width: 500,
                                  height: 700,
                                  repeat: true,
                                ),
                              )
                      : requests.updateRequests.length != 0
                      ? ListView.builder(
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 130,
                              child: landLordRequestsCard(
                                accept: () async {
                                  await acceptUpdateRequests(
                                    context: context,
                                    book: requests.updateRequests[index],
                                  );
                                },
                                reject: () async {
                                  await rejectUpdateRequests(
                                    context: context,
                                    book: requests.updateRequests[index],
                                  );
                                },
                                book: requests.updateRequests[index],
                              ),
                            );
                          },
                          itemCount: requests.updateRequests.length,
                        )
                      : Center(
                          child: Lottie.asset(
                            "assets/animation/requests.json",
                            width: 500,
                            height: 700,
                            repeat: true,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
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
