import 'package:flutter/material.dart';
import 'pages/goals_page.dart';
import 'pages/registration/inputphone_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTitle = 'ferda';

    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        //group page maybe?
        initialRoute:
            '/goals', //to be mroe RESTful should this be something like '/group/[id]'?
        routes: {
          '/registration/phone': (ctx) => InputPhonePage(),
          '/registration/group-name': (ctx) => InputGroupPage(),
          '/registration/verification': (ctx) => InputVerificationCodePage(),
          '/registration/invite': (ctx) => InviteUsers(),
          '/goals': (ctx) => GoalsPage(),
          '/goals/set': (ctx) => SetGoalPage(),
          '/goals/show': (ctx) => ShowGoalPage(),
        },

        //previsous code here built the scaffold Appbar, but I moved that logic into the GoalsPage return method

        home: GoalsPage());
  }
}
