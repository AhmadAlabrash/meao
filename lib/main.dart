import 'package:flutter/material.dart';
import 'package:meao/api/firebase_api.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await FirebaseApi().initNotifications();
  

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: 
  [SystemUiOverlay.top, SystemUiOverlay.bottom]); 

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.white,
  statusBarBrightness: Brightness.light ,

));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: FutureBuilder<bool>(
        future: isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            if (snapshot.hasData && snapshot.data!) {
              return WebViewScreen(url: 'https://magicai.liquid-themes.com/login/');
               

            } else{
                return WebViewScreen(url: 'https://magicai.liquid-themes.com/login/');
              }
          }
        },
      ),)
   
   
    );
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}

class WebViewScreen extends StatelessWidget {
  final String url;

  WebViewScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}



class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/welcome.png', // Replace 'welcome_image.png' with your image asset
              width: 200,
              height: 200,
              // You can adjust width and height according to your image size
            ),
            SizedBox(height: 20),
            Text(
              'Get your creative ideas\nand your AI friend also here',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebViewScreen(url: 'https://magicai.liquid-themes.com/login/'),
              ),
            );
          },
          child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
