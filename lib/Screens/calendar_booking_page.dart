import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Models/book.dart';
import 'package:baytech/helper/show_to_do_something_dialoge.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:baytech/services/houses/bookings/renter/book_request.dart';
import 'package:baytech/services/houses/bookings/renter/update_booking.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:table_calendar/table_calendar.dart';

class calendar_book extends StatefulWidget {
  static String id = "calendar_page";
  const calendar_book({super.key});

  @override
  State<calendar_book> createState() => _calendar_bookState();
}

class _calendar_bookState extends State<calendar_book> {
  List<DateTime> resevdays = [];
  Apartment house = Apartment();
  bool booking = true;
  Book book = Book();
  DateTime _focused_day = DateTime.now();
  DateTime? _select_day;
  DateTime? _range_StartDay;
  DateTime? _range_EndDay;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;

  @override
  void initState() {
    super.initState();
    _select_day = _focused_day;
    _range_StartDay = null;
    _range_EndDay = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map<String, dynamic>) {
      setState(() {
        book = args['book'] ?? book;
        booking = args['booking'] ?? true;
        resevdays = args['bookedDays'] ?? resevdays;
        house = args['house'] ?? house;
      });
    }
  }

  bool _Day_isBooked(DateTime day) {
    final theday = DateTime.utc(day.year, day.month, day.day);
    return resevdays.any((reserved) => isSameDay(theday, reserved));
  }

  bool _range_isBooked(DateTime start, DateTime end) {
    DateTime sele = start;
    while (sele.isBefore(end) || isSameDay(sele, end)) {
      if (_Day_isBooked(sele)) {
        return true;
      }
      sele = sele.add(const Duration(days: 1));
    }
    return false;
  }

  void _dayinrangeisbooked(DateTime selectDay, DateTime focuday) {
    if (_Day_isBooked(selectDay)) {
      return;
    }
    setState(() {
      _select_day = selectDay;
      _focused_day = focuday;
      _range_StartDay = null;
      _range_EndDay = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
  }

  void _Rangeselect(DateTime? start, DateTime? end, DateTime focusday) {
    setState(() {
      _select_day = null;
      _focused_day = focusday;
      _range_StartDay = start;
      _range_EndDay = end;
    });
    if (start != null && end != null) {
      if (_range_isBooked(start, end)) {
        setState(() {
          _range_StartDay = null;
          _range_EndDay = null;
          _rangeSelectionMode = RangeSelectionMode.toggledOn;
        });
        return;
      }
    }
  }

  void _ACBooking() async {
    if (_select_day != null) {
      await bookHouseRequest(
        context: context,
        start: _select_day!,
        end: _select_day!,
        house: house,
      );
    } else if (_range_StartDay != null && _range_EndDay != null) {
      showToDoSomeThingDialoge(
        context,
        message:
            "you are going to send a booking request for this house, are you sure?",
        cancel: true,
        toDo: () async {
          await bookHouseRequest(
            context: context,
            start: _range_StartDay!,
            end: _range_EndDay!,
            house: house,
          );
        },
      );
    }
    setState(() {
      _select_day = null;
      _range_StartDay = null;
      _range_EndDay = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
  }

  void _AC2Booking() async {
    if (_select_day != null) {
      await (
        context: context,
        start: _select_day!,
        end: _select_day!,
        house: house,
      );
    } else if (_range_StartDay != null && _range_EndDay != null) {
       showToDoSomeThingDialoge(
        context,
        message:
            "you are going to send an update request for this house, are you sure?",
        cancel: true,
        toDo: () async {
          await updateBooking(
            context: context,
            start: _range_StartDay!,
            end: _range_EndDay!,
            book: book,
          );
        },
      );
    }
    setState(() {
      _select_day = null;
      _range_StartDay = null;
      _range_EndDay = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    String path = Theme.of(context).brightness == Brightness.light
        ? 'assets/animation/homeLight.json'
        : 'assets/animation/Home Dark.json';
    final bool selectionMode =
        _select_day != null ||
        (_range_StartDay != null && _range_EndDay != null);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(path, width: 300, height: 300, repeat: true),
            TableCalendar(
              locale: Localizations.localeOf(context).languageCode,
              focusedDay: _focused_day,
              firstDay: DateTime.utc(2024, 1, 1),
              lastDay: DateTime.utc(2030, 1, 1),
              enabledDayPredicate: (day) {
                return !_Day_isBooked(day);
              },
              selectedDayPredicate: (day) => isSameDay(_select_day, day),
              onDaySelected: _dayinrangeisbooked,
              rangeStartDay: _range_StartDay,
              rangeEndDay: _range_EndDay,
              rangeSelectionMode: _rangeSelectionMode,
              onRangeSelected: _Rangeselect,
              onDisabledDayTapped: (day) {},
              calendarStyle: CalendarStyle(
                disabledTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  decoration: TextDecoration.lineThrough,
                ),
                rangeHighlightColor: const Color.fromARGB(255, 210, 194, 239),
                rangeStartDecoration: BoxDecoration(
                  color: const Color.fromARGB(255, 103, 76, 150),
                  shape: BoxShape.circle,
                ),
                rangeEndDecoration: BoxDecoration(
                  color: const Color.fromARGB(255, 103, 76, 150),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 103, 76, 150),
                  shape: BoxShape.circle,
                ),
              ),
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(formatButtonVisible: false),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                S.of(context).calendar_instruction.toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            booking == true
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: selectionMode ? _ACBooking : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(300, 60),
                      ),
                      child: Text(
                        S.of(context).book_now.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: selectionMode ? _AC2Booking : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(300, 60),
                      ),
                      child: Text(
                        S.of(context).update_booking,
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
