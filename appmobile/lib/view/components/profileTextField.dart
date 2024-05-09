import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileTextField extends StatelessWidget {
  final String _textLabelTop;
  final dynamic _textHint;

  ProfileTextField({
    Key? key,
    required String textLabelTop,
    required dynamic textHint,
    double? bottom = 10,
  })  : _textLabelTop = textLabelTop,
        _textHint = textHint,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isEditable = false;
    String displayText = _textHint.toString();

    // Check if _textHint is a list and join its elements into a single string
    if (_textHint is List<String>) {
      displayText = _textHint.join(', ');
    } else {
      displayText = _textHint.toString();
    }

    // Format date if the input is DateTime
    if (_textHint is DateTime) {
      var formatter = DateFormat.yMMMMd('fr_FR');
      displayText = formatter.format(_textHint);
    }

    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\t' + _textLabelTop,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          TextField(
            maxLines: null,
            enabled: isEditable,
            readOnly: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: const Color.fromARGB(
                      255, 79, 79, 79), // Change border color here
                ),
              ),
              contentPadding: EdgeInsets.only(left: 12, top: 7, bottom: 7),
              hintText: displayText,
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color.fromARGB(255, 15, 15, 15),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
