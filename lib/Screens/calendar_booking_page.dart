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
  final List<DateTime> _resevdays = [
    DateTime.utc(2025, 12, 20),
    DateTime.utc(2025, 12, 21),
    DateTime.utc(2025, 12, 21),
    DateTime.utc(2026, 1, 1),
  ];
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

  bool _Day_isBooked(DateTime day) {
    final theday = DateTime.utc(day.year, day.month, day.day);
    return _resevdays.any((reserved) => isSameDay(theday, reserved));
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

  void _ACBooking() {
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
        : 'dark theme ';
    final bool selectionMode =
        _select_day != null ||
        (_range_StartDay != null && _range_EndDay != null);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(path, width: 300, height: 250, repeat: true),
            TableCalendar(
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
                  color: Colors.red,
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
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Press and hold for a single day book.",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: selectionMode ? _ACBooking : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: const Size(300, 60),
                ),
                child: Text(
                  'Book Now',
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
