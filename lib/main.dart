import 'package:baatcheet/src/screen/contactPage.dart';
import 'package:baatcheet/src/screen/groupPage.dart';
import 'package:baatcheet/src/screen/listPage.dart';
import 'package:baatcheet/src/screen/messagePage.dart';
import 'package:baatcheet/theme_data.dart';
import 'package:flutter/material.dart';

import 'route_generator.dart';

void main() {
  runApp(const EntryPoint());
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BaatCheet',
        theme: lightTheme,
        darkTheme: darkTheme,
        initialRoute: splashRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const MessagePage(),
    const GroupPage(),
    const ListPage(),
    const ContactPage()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.message, color: Colors.redAccent),
              label: "Message"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
                color: Colors.redAccent,
              ),
              label: "Group"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.redAccent), label: "List"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts, color: Colors.redAccent),
              label: "Contacts"),
        ],
      ),
    );
  }
}
