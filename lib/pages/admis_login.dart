
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/widget/header_widget.dart';

import '../common/theme_helper.dart';
import '../home_page/admis_page.dart';


class AdmisLogin extends StatefulWidget {
  //AdmisLogin({required Key key}) : super(key: key);

  @override
  _AdmisLoginState createState() => _AdmisLoginState();
}

class _AdmisLoginState extends State<AdmisLogin>{

  double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_sharp),
            ),

            SafeArea(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                      children: [
                      Text(
                      'Bienvenue',
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                         Text(
                            'Connectez-vous pour accéder à votre compte',
                            style: TextStyle(color: Colors.grey)
                        ),
                   SizedBox(height: 20,),

                   Form(
                   key: _formKey,
                    child: Column(
                     children: [
                       TextFormField(
                    decoration: ThemeHelper().textInputDecoration('E-mail', 'Entrez votre adresse e-mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                        return "Entrer un addresse mail valide ";
                      }
                      return null;
                    },
                  ),
                      SizedBox(height: 30.0,),

                       TextFormField(
                    obscureText: true,
                    decoration: ThemeHelper().textInputDecoration( 'Mot de passe', 'Entrez votre mot de passe'),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Entrer un mot de passe";
                      }
                      return null;
                    },
                  ),
                      SizedBox(height: 10.0,),
                       Container(
                        decoration: ThemeHelper().buttonDecoration(context),
                         child: ElevatedButton(
                           style: ThemeHelper().buttonStyle(),
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                               child: Text(
                               'Se connecter'.toUpperCase(),
                                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                               ),
                              ),
                              onPressed: () {
                              if (_formKey.currentState!.validate()){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AdmisPage()));
                       }
                     }
                   )
                 )
                ],
              )

            )
          ]
        ),
      )
    )
    ]
    )
    )
    );
  }

}