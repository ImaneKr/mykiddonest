// ignore_for_file: file_names, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:appmobile/models/kid.dart';

class KidSelection extends StatelessWidget {
  final Kid? kid;
  final bool isSelected;
  final VoidCallback onTap;

  const KidSelection({
    Key? key,
    required this.kid,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 30,
        width: 30,
        child: Image(
          image: isSelected
              ? (kid.gender == 'Boy'
                  ? AssetImage('assets/icons/boySelected.png')
                  : AssetImage('assets/icons/girlSelected.png'))
              : (kid.gender == 'Boy'
                  ? AssetImage('assets/icons/boy.png')
                  : AssetImage('assets/icons/girl.png')),
        ),
      ),
      title: Text(
        kid.firstName,
        style: TextStyle(
          fontFamily: 'inter',
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: isSelected ? Color(0xFF8BC62A) : Colors.black,
        ),
      ),
      onTap: onTap,
    );
  }
}
