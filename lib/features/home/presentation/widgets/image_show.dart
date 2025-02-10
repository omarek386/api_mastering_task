import 'package:flutter/material.dart';

class ImageShow extends StatelessWidget {
  const ImageShow({
    this.profilePic,
    super.key,
  });
  final String? profilePic;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        image: profilePic == null
            ? null
            : DecorationImage(
                image: NetworkImage(profilePic!),
                fit: BoxFit.cover,
              ),
      ),
      child: profilePic == null
          ? Icon(
              Icons.person_outline, // Placeholder profile icon
              size: 60,
              color: Colors.black38,
            )
          : null,
    );
  }
}
