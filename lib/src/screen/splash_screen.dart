import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../route_generator.dart';
import '../../project_meta_data.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(preRoute, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(appName, style: Theme.of(context).textTheme.headline5),
            SizedBox(
              height: 20,
            ),
            Text(appVersion, style: Theme.of(context).textTheme.headline6),
            SizedBox(
              height: 40,
            ),
            Image(
                image: AssetImage(appLogo),
                width: 128,
                height: 128,
                fit: BoxFit.cover),
            SizedBox(
              height: 40,
            ),
            CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).accentColor))
          ],
        ),
      ),
    );
  }
}
