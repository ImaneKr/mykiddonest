import 'package:flutter/material.dart';

class DayContainer extends StatefulWidget {
  final String day;
  final int dayInt;
  final bool isSelected;
  final VoidCallback onTap;
  final int month;
  final bool otherSelected;

  const DayContainer({
    Key? key,
    required this.day,
    required this.dayInt,
    required this.isSelected,
    required this.onTap,
    required this.month,
    required this.otherSelected,
  }) : super(key: key);

  @override
  State<DayContainer> createState() => _DayContainerState();
}

class _DayContainerState extends State<DayContainer> {
  static const Map<String, String> dayAbbreviations = {
    'Sunday': 'Sun',
    'Monday': 'Mon',
    'Tuesday': 'Tue',
    'Wednesday': 'Wed',
    'Thursday': 'Thu',
    'Friday': 'Fri',
    'Saturday': 'Sat',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (widget.isSelected ||
                ((widget.dayInt == DateTime.now().day &&
                        widget.month == DateTime.now().month) &&
                    !widget.otherSelected))
            ? Colors.white
            : Colors.transparent,
      ),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: widget.onTap, // Corrected onTap callback
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              dayAbbreviations[widget.day] ?? '',
              style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
            Text(
              widget.dayInt.toString(),
              style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
            (widget.isSelected ||
                    ((widget.dayInt == DateTime.now().day &&
                            widget.month == DateTime.now().month) &&
                        !widget.otherSelected))
                ? Center(
                    child: Icon(
                      Icons.circle,
                      size: 6,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
