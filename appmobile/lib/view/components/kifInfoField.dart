import 'package:flutter/material.dart';

class KidInfoField extends StatefulWidget {
  final String textHintf;
  final String labelf;

  KidInfoField({
    Key? key,
    required this.textHintf,
    required this.labelf,
    double? bottom = 10,
  }) : super(key: key);

  @override
  _KidInfoFieldState createState() => _KidInfoFieldState();
}

class _KidInfoFieldState extends State<KidInfoField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\t' + widget.labelf,
            style: TextStyle(
              color: Color.fromARGB(255, 45, 49, 56),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            textAlign: TextAlign.start,
            maxLines: null, // Allows multiple lines
            keyboardType:
                TextInputType.multiline, // Specifies the keyboard type
            textInputAction:
                TextInputAction.newline, // Action button to start a new line
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: const Color.fromARGB(255, 55, 55, 55)),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: widget.textHintf,
              hintStyle: TextStyle(
                fontFamily: 'roboto mono',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF4B4949),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF48A2E7)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
