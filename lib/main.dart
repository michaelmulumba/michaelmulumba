import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login/pages/splash_screen.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {

  // Color _primaryColor = HexColor('#dc54fe');
  // Color _accentColor = HexColor('#ba02ae');

  // Design color
   //Color _primaryColor= HexColor('#FFC867');
   //Color _accentColor= HexColor('#FF3CBD');
   Color _primaryColor= HexColor('#87f542');
   Color _accentColor= HexColor('#42f5c5');


  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
 // Color _primaryColor= HexColor('#651BD2');
 // Color _accentColor= HexColor('#320181');


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: _accentColor),
      ),
      home: const SplashScreen(title: 'Flutter Login'),
    );
  }
}

