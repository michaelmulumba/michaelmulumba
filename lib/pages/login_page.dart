import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/common/theme_helper.dart';




import 'forgot_password_page.dart';
import '../home_page/clients_page.dart';
import 'registration_page.dart';
import 'widget/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  double _headerHeight = 250;
  //Key _formKey = GlobalKey<FormState>();
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
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
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
                      SizedBox(height: 30.0),
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

                            SizedBox(height: 30.0),
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
                            SizedBox(height: 15.0),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                                  );
                                },
                                child: Text(
                                  'Mot de passe oublié ?',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.secondary,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),

                            ),


                            Container(
                              decoration: ThemeHelper().buttonDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    "Se connecter".toUpperCase(),
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                ),
                                onPressed: () {
                                  if(_formKey.currentState!.validate()){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ClientsPage()));
                                  }
                                }
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              //child: Text('Vous n\'avez pas de compte ? Créez-en un'),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: 'Vous n\'avez pas de compte ? '),
                                    TextSpan(
                                      text: 'Créez-en un',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                        },
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),
                                    ),
                                  ]
                                )
                              ),
                            ),
                          ],
                        )
                      )
                    ],
                  )
            ))
          ]
        )
      )
    );
  }
}
