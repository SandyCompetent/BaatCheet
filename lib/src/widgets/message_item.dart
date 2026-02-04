import 'package:flutter/material.dart';
import 'package:flutter_master_template/project_meta_data.dart';

Widget MessageItem(
    String imgRef, String txtPersonName, String txtMessage, String txtTime) {
  return Row(
    children: [
      Material(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        child: Image.asset('assets/app_logo.png', height: 90, width: 90),
      ),
      Column(
        children: [
          Text(txtPersonName),
          Text(txtMessage),
        ],
      ),
      Text(txtTime),
    ],
  );
}
