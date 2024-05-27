import 'package:flutter/material.dart';
import 'package:menu_navigator/theme/Colors.dart';

class ProfileList extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;
  const ProfileList({super.key, required this.icon, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon,
              height: 15, width: 15, fit: BoxFit.contain),
            const SizedBox(
              width: 15,
              ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios,size:11,color:primary),
          ]
        ),
      ),
    );
  }
}