import 'package:baytech/Constants.dart';
import 'package:baytech/Models/book.dart';
import 'package:baytech/helper/show_to_do_something_dialoge.dart';
import 'package:baytech/providers/landLordRequestsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class landLordRequestsCard extends StatefulWidget {
  Book book;
  Function accept, reject;
  landLordRequestsCard({
    required this.book,
    required this.accept,
    required this.reject,
  });

  @override
  State<landLordRequestsCard> createState() => _BookCardState();
}

class _BookCardState extends State<landLordRequestsCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<landLordRequestsProvider>(
      builder: (context, requests, child) => Card(
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
                radius: 45,
                backgroundImage: NetworkImage(
                  KbaseUrlImage + widget.book.personal_photo!,
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
                      widget.book.first_name! + " " + widget.book.last_name!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),

                    Text(
                      "from: ${widget.book.start_date}\nto: ${widget.book.end_date}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    widget.book.price_diff != null
                        ? Text(
                            "benefit: \$${widget.book.price_diff}",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          )
                        : SizedBox(height: 10),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        showToDoSomeThingDialoge(
                          context,
                          cancel: true,
                          message:
                              "you're about to accept this request , are you sure?",
                          toDo: () async {
                            await widget.accept();
                            requests.setBookings(widget.book.house!, context);
                            requests.setUpdate(widget.book.house!, context);
                          },
                        );
                      },
                      child: Text("accept"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Theme.of(context).scaffoldBackgroundColor
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        showToDoSomeThingDialoge(
                          context,
                          cancel: true,
                          message:
                              "you're about to reject this request , are you sure?",
                          toDo: () async {
                            await widget.reject();
                            requests.setBookings(widget.book.house!, context);
                            requests.setUpdate(widget.book.house!, context);
                          },
                        );
                      },
                      child: Text("reject"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
