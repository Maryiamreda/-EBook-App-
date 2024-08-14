import 'package:flutter/material.dart';
import 'package:ebook_app/app_colors.dart' as Appcolors;

class appTabs extends StatelessWidget {
  final Color color;
  final String text;
  const appTabs({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      child: Text(
        this.text,
        style: TextStyle(color: Colors.white),
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: this.color,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 7,
                offset: Offset(0, 0))
          ]),
    );
  }
}
