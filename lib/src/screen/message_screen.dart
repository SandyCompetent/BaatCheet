import 'package:flutter/material.dart';
import 'package:flutter_master_template/project_meta_data.dart';
import 'package:flutter_master_template/src/widgets/message_item.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Center(
          child: Container(
              child: Column(
        children: [
          MessageItem(appLogo, 'Raja', 'i am raja', '08:00'),
          MessageItem(appLogo, 'Rani', 'i am rani', '07:00'),
          MessageItem(appLogo, 'Choor', 'i am choor', '10:00'),
          MessageItem(appLogo, 'Police', 'i am polic', '12:00'),
        ],
      ))),
    );
  }
}
