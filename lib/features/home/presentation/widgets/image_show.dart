import 'package:flutter/material.dart';

class ImageShow extends StatelessWidget {
  const ImageShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white, // White circle background
      ),
      child: Icon(
        Icons.person_outline, // Placeholder profile icon
        size: 60,
        color: Colors.black38,
      ),
    );
  }
}
