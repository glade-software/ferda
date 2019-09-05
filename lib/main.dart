import 'package:flutter/material.dart';
import 'screens/goals_page.dart';
import 'screens/register.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final appTitle='ferda';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      //group page maybe?
      initialRoute: '/goals', //to be mroe RESTful should this be something like '/group/[id]'?
      routes: {
        '/login': (ctx) => RegisterForm(),
        '/goals': (ctx) => GoalsPage(),
      },

      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: GoalsPage(),
      )
    );
  }
}