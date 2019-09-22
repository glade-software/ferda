import 'package:flutter/material.dart';
import 'pages/registration/input_group_name_page.dart';
import 'pages/registration/input_phone_number_page.dart';
import 'pages/registration/input_verification_code_page.dart';
import 'pages/registration/invite_contacts_page.dart';

import 'pages/goals/list_goals_page.dart';
import 'pages/goals/set_goal_page.dart';
import 'pages/goals/show_goal_page.dart';

//improt registeration widgets

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final String appTitle = 'ferda';

    return MaterialApp(
        title: appTitle,
        //setting initial route to input phone number page for testing purposes.
        initialRoute: '/registration/phone',
        home: InputPhonePage(),
        routes: {
          '/registration/phone': (ctx) => InputPhonePage(),
          '/registration/group-name': (ctx) => SetGroupNamePage(),
          '/registration/verification': (ctx) => InputVerificationCodePage(),
          '/registration/invite': (ctx) => InviteContactsPage(),
          '/goals': (ctx) => ListGoalsPage(),
          '/goals/set': (ctx) => SetGoalPage(),
          '/goals/show': (ctx) => ShowGoalPage(),
        });
  }
}
