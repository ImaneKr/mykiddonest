import 'package:flutter/material.dart';
import 'package:appmobile/models/kid.dart';

class KidSelection extends StatelessWidget {
  final Kid? kid;
  final bool isSelected;
  final VoidCallback onTap;
  final String? label;

  const KidSelection({
    Key? key,
    this.kid,
    required this.isSelected,
    required this.onTap,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          child: IconButton(
            icon: _buildImageWidget(),
            onPressed: () {},
          ),
        ),
        title: Text(
          kid?.firstName ?? label ?? 'No Kid',
          style: TextStyle(
            fontFamily: 'inter',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Color(0xFF8BC62A) : Colors.black,
          ),
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildImageWidget() {
    if (kid != null) {
      return Image(
        image: isSelected
            ? (kid!.gender == 'Boy'
                ? AssetImage('assets/icons/boySelected.png')
                : AssetImage('assets/icons/girlSelected.png'))
            : (kid!.gender == 'Boy'
                ? AssetImage('assets/icons/boy.png')
                : AssetImage('assets/icons/girl.png')),
      );
    } else {
      return Icon(
        Icons.add,
        color: Colors.black, // Change color on press
      );
    }
  }
}
