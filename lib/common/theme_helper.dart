import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeHelper{

 InputDecoration textInputDecoration([String labelText="", String hintText=""]){
   return InputDecoration(
     labelText: labelText,
     hintText: hintText,
     fillColor: Colors.white,
     filled: true,
     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
     focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey)),
     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
     errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
     focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
   );
 }

 BoxDecoration buttonDecoration(BuildContext context, [String color1 ="", String color2 =""]){
   Color c1 = Theme.of(context).primaryColor;
   Color c2 = Theme.of(context).colorScheme.secondary;
   if(color1.isEmpty == false){
     c1 = HexColor(color1);
   }
   if(color2.isEmpty == false){
     c2 = HexColor(color2);
   }

   return BoxDecoration(
     boxShadow: [
       BoxShadow(color: Colors.black26, offset: Offset(0.0, 4.0), blurRadius: 5.0)
     ],
     gradient: LinearGradient(
       begin: Alignment.topLeft,
       end: Alignment.bottomRight,
       stops: [0.0, 1.0],
       colors: [
         c1,
         c2
       ],
     ),
     color: Colors.deepPurple[300],
     borderRadius: BorderRadius.circular(30.0),
   );
 }

 ButtonStyle buttonStyle(){
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(Size(50.0, 50.0)),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  inputBoxDecorationShadow() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 9.0,
          offset: Offset(0, 2),
        ),
      ],
    );
  }

  buttonBoxDecoration(BuildContext context, [String color1 ="", String color2 =""]){
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 9.0,
          offset: Offset(0, 2),
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 1.0],
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).colorScheme.secondary,
        ],
      ),
      color: Colors.deepPurple[300],
      borderRadius: BorderRadius.circular(30.0),
    );
  }

  Widget alartDialog(String s, String t, BuildContext context) {
    return AlertDialog(
      title: Text(t),
      content: Text(s),
      actions: <Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class LoginFormStyle{

}