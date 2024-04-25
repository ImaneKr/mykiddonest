import 'package:flutter/material.dart';

class GuardianInfoField extends StatefulWidget {
  final String _initialValue;
  final String _label;
  final bool _isPassword;

  GuardianInfoField({
    Key? key,
    required String initialValue,
    required String label,
    bool isPassword = false,
  })  : _initialValue = initialValue,
        _label = label,
        _isPassword = isPassword,
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
          child: TextField(
            obscureText: widget._isPassword ? _isObscured : false,
            controller: _controller,
            textAlign: TextAlign.start,
            maxLines: 1, // Allows multiple lines
            keyboardType:
                TextInputType.multiline, // Specifies the keyboard type
            textInputAction:
                TextInputAction.newline, // Action button to start a new line
            decoration: InputDecoration(
              suffixIcon: widget._isPassword
                  ? IconButton(
                      icon: _isObscured
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: _toggleVisibility,
                    )
                  : null, // Conditionally show icon only for password field
              contentPadding: EdgeInsets.only(
                  left: 15,
                  right: widget._isPassword ? 48.0 : 15.0,
                  top: widget._isPassword ? 10 : 5,
                  bottom: 5),
              border: InputBorder.none, // Remove border
              focusedBorder: InputBorder.none, // Remove focused border
            ),
            onChanged: (value) {
              setState(() {}); // Trigger rebuild to update UI
            },
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
