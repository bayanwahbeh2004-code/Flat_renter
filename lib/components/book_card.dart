import 'package:baytech/Constants.dart';
import 'package:baytech/Models/book.dart';
import 'package:baytech/Screens/calendar_booking_page.dart';
import 'package:baytech/Screens/viewAppartment.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:baytech/helper/show_to_do_something_dialoge.dart';
import 'package:baytech/providers/myBookingsProvider.dart';
import 'package:baytech/services/houses/bookings/renter/cancel_booking_user.dart';
import 'package:baytech/services/houses/favourite/isFavourite.dart';
import 'package:baytech/services/houses/show_houses/get_images.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class BookCard extends StatefulWidget {
  Book book;
  bool isCancelled;
  BookCard({required this.book, required this.isCancelled});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          widget.book.house!.images = await getImages(
            context: context,
            house: widget.book.house!,
          );
          widget.book.house!.isFavourite = await isfavourite(
            context: context,
            id: widget.book.house!.id!,
          );
          Navigator.pushNamed(
            context,
            ApartmentDetailsPage.id,
            arguments: widget.book.house,
          );
          setState(() {
            isLoading = false;
          });
        },
        child: Consumer<BookingsProvider>(
          builder: (context, bookings, child) => Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              height: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      KbaseUrlImage + widget.book.house!.mainImage!,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.book.house!.title!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),

                        Text(
                          "from:${widget.book.start_date}\nto:${widget.book.end_date}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.isCancelled != true
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    calendar_book.id,
                                    arguments: {
                                      'book': widget.book,
                                      'booking': false,
                                    },
                                  );
                                },
                                child: Text(
                                  S.of(context).uptd,
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  showToDoSomeThingDialoge(
                                    context,
                                    message: S.of(context).cancel_booking_msg,
                                    cancel: true,
                                    toDo: () async {
                                      await cancelBooking(
                                        context: context,
                                        book: widget.book,
                                      );
                                      bookings.setBookings(
                                        S.of(context).currenthaf,
                                        context,
                                      );
                                    },
                                  );

                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                                child: Text(S.of(context).cancel),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
