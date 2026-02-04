import 'package:flutter/material.dart';
import 'package:flutter_master_template/project_meta_data.dart';
import 'package:flutter_master_template/src/widgets/message_item.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          "Edit",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.redAccent,
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
          child: Container(
              child: Column(
        children: [
          MessageItem(
              appLogo, 'Oswald obblepot', 'i am Oswald obblepot', '08:00'),
          MessageItem(appLogo, 'Fish Mooney', 'i am Fish Mooney', '07:00'),
          MessageItem(appLogo, 'Bruce Wayne', 'i am Bruce Wayn', '10:00'),
          MessageItem(appLogo, 'Barbara Kean', 'i am Barbara Kean', '12:00'),
          MessageItem(appLogo, 'Barbara Kean', 'i am Barbara Kean', '12:00'),
          MessageItem(appLogo, 'Barbara Kean', 'i am Barbara Kean', '12:00'),
          MessageItem(appLogo, 'Barbara Kean', 'i am Barbara Kean', '12:00'),
        ],
      ))),
    );
  }
}
