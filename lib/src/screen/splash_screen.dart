import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../route_generator.dart';
import '../../project_meta_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(loginRoute, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(appName, style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(
              height: 20,
            ),
            Text(appVersion, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(
              height: 40,
            ),
            Image(
                image: const AssetImage(appLogo),
                width: 128,
                height: 128,
                fit: BoxFit.cover),
            const SizedBox(
              height: 40,
            ),
            CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.secondary))
          ],
        ),
      ),
    );
  }
}
