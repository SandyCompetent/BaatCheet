import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final String imgRef;
  final String txtPersonName;
  final String txtMessage;
  final String txtTime;

  const MessageItem({
    super.key,
    required this.imgRef,
    required this.txtPersonName,
    required this.txtMessage,
    required this.txtTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
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
}
