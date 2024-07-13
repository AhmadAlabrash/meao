import 'package:flutter/material.dart';

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
                // Navigate to the next screen (sign up, for example)
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
