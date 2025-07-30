import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:saasapp/util/color.dart';

class ImagePrevev extends StatelessWidget {
  final String? iamgepath;
  const ImagePrevev({super.key, required this.iamgepath});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      // color: mainColor.withOpacity(0.1),
      decoration: BoxDecoration(
        color: mainColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: mainColor.withOpacity(0.2), width: 1),
      ),
      child: iamgepath == null
          ? Center(child: Icon(Icons.image))
          : Image.file(File(iamgepath!), fit: BoxFit.cover),
    );
  }
}
