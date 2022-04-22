
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/pages/splash_screen.dart';

import '../pages/widget/header_widget.dart';
import '../system/add_collector.dart';

class AdmisPage extends StatefulWidget {



  @override
  State<StatefulWidget> createState(){
    return _HomePageState();
  }
}

class _HomePageState extends State<AdmisPage>{

  double _drawerIconSize = 24.0;
  double _drawerFontSize = 17.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Admis profile",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0.5,
          iconTheme: IconThemeData(color: Colors.black),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary]
                )
            ),
          ),
          actions: [
            Container(
                margin: EdgeInsets.only( top: 16, right: 16),
                child: Stack(
                    children: [
                      Icon(Icons.notifications),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6),),
                          constraints: BoxConstraints( minWidth: 12, minHeight: 12,),
                          child: Text('7', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
                        ),
                      )
                    ]
                )
            )
          ],
        ),
        drawer: Drawer(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                      colors: [Theme.of(context).primaryColor.withOpacity(0.1), Theme.of(context).colorScheme.secondary.withOpacity(0.4),]
                  )
              ),
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 1.0],
                        colors: [Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary],
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text('Menu',
                        style: TextStyle(fontSize: 25, color: Colors.black26, fontWeight: FontWeight.bold ),
                      ),
                    ),
                  ),
                  ListTile(
                      leading: Icon(Icons.screen_lock_landscape, size: _drawerIconSize, color: Colors.black26,),
                      title: Text('Ecran d\'accuiel', style: TextStyle(fontSize: 17,color: Colors.black26),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(title: 'Ecran d\'accuiel',)));
                      }
                  ),

                  Divider(color: Theme.of(context).primaryColor, height: 1,),
                  ListTile(
                    leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: Colors.black26,),
                    title: Text('Logout',style: TextStyle(fontSize: _drawerFontSize,color: Colors.black26),),
                    onTap: () {
                      SystemNavigator.pop();
                    },
                  ),
                ],
              ),
            )
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: GridView(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(title: 'Ecran d\'accuiel',)));
                },
                child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 50, color: Colors.white,),
                    Text('Ajouter un Collecteur', textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  ]
                )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.report, size: 50, color: Colors.white,),
                    Text('Rapport de travail', textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  ]
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.task, size: 50, color: Colors.white,),
                    Text('Plainte', textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  ]
                )
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings, size: 50, color: Colors.white,),
                    Text('Paramètres', textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  ]
                )
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_rounded, size: 50, color: Colors.white,),
                    Text('Clients', textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  ]
                )
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.update_rounded, size: 50, color: Colors.white,),
                    Text('Mise à jour', textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  ]
                ),
              )
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
          ),
        )
      ),
    );
  }

}