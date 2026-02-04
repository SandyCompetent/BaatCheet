import 'package:flutter/material.dart';
import 'package:flutter_master_template/src/screen/contactPage.dart';
import 'package:flutter_master_template/src/screen/groupPage.dart';
import 'package:flutter_master_template/src/screen/listPage.dart';
import 'package:flutter_master_template/src/screen/messagePage.dart';
import 'package:flutter_master_template/theme_data.dart';
import 'route_generator.dart';

void main() {
  runApp(EntryPoint());
}

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'SandyTech Master Template',
        theme: lightTheme,
        darkTheme: darkTheme,
        initialRoute: splashRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MessagePage(),
    GroupPage(),
    ListPage(),
    ContactPage()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.message, color: Colors.redAccent),
              title: new Text(
                "Message",
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              )),
          BottomNavigationBarItem(
              icon: new Icon(
                Icons.group,
                color: Colors.redAccent,
              ),
              title: new Text(
                "Group",
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              )),
          BottomNavigationBarItem(
              icon: new Icon(Icons.list, color: Colors.redAccent),
              title: new Text(
                "List",
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              )),
          BottomNavigationBarItem(
              icon: new Icon(Icons.contacts, color: Colors.redAccent),
              title: new Text(
                "Contacts",
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              )),
        ],
      ),
    );
  }
}

/*class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Hello World')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.message, size: 40.0),
                  Icon(Icons.group, size: 40.0),
                  SizedBox.shrink(),
                  Icon(Icons.list, size: 40.0),
                  Icon(Icons.contacts, size: 40.0),
                ],
              ),
            )),
      ),
    );
  }
}*/
