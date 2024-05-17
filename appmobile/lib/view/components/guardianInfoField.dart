import 'package:flutter/material.dart';

class GuardianInfoField extends StatefulWidget {
  final String _initialValue;
  final String _label;
  final bool _isPassword;
  final bool _isDate;
  final ValueChanged<String> onChange;

  GuardianInfoField({
    Key? key,
    required String initialValue,
    required String label,
    required this.onChange,
    bool isPassword = false,
    bool isDate = false,
  })  : _initialValue = initialValue,
        _label = label,
        _isPassword = isPassword,
        _isDate = isDate,
        super(key: key);

  @override
  _GuardianInfoFieldState createState() => _GuardianInfoFieldState();
}

class _GuardianInfoFieldState extends State<GuardianInfoField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget._initialValue);
  }

  bool _isObscured = true;

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\t' + widget._label,
          style: TextStyle(
            color: Color.fromARGB(255, 45, 49, 56),
            fontFamily: 'inter',
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFF3F4F6),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  obscureText: widget._isPassword ? _isObscured : false,
                  controller: _controller,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    suffixIcon: widget._isPassword
                        ? IconButton(
                            icon: _isObscured
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: _toggleVisibility,
                          )
                        : (widget._isDate
                            ? GestureDetector(
                                onTap: () {
                                  // Add functionality to show date picker
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100),
                                  ).then((selectedDate) {
                                    if (selectedDate != null) {
                                      // Handle the selected date
                                      widget.onChange(selectedDate.toString());
                                    }
                                  });
                                },
                                child: Icon(Icons.calendar_today),
                              )
                            : null),
                    contentPadding: EdgeInsets.only(
                      left: 15,
                      right: widget._isPassword ? 48.0 : 15.0,
                      top: widget._isPassword ? 10 : 5,
                      bottom: 5,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: widget.onChange,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
