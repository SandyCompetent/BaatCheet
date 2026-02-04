import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.redAccent,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Material(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            child: Image.asset('assets/app_logo.png'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Sandeep Malviya',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Founder and CEO of SandyTech "Lets get started"',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomListTile('Email Address', () => {}),
          CustomListTile('Telephone', () => {}),
          CustomListTile('Notification', () => {}),
          CustomListTile('Settings', () => {}),
          CustomListTile('Feedback', () => {}),
          CustomListTile('Get help', () => {}),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  String text;
  Function onTap;
  CustomListTile(this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: Colors.redAccent,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
