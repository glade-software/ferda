import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ferda/widgets/PromptedInput.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// View all goals in your group
class ListGoalsPage extends StatefulWidget {
  @override
  ListGoalsPageState createState() {
    return ListGoalsPageState();
  }
}

class ListGoalsPageState extends State<ListGoalsPage> {
  // Homepage
  // if user is not signed in, "Did you get a link? If you did, go click it now."
  // Go to input_phone_number_page if "Don't have a link? click here"
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: <Widget>[
        Container(
            padding: const EdgeInsets.symmetric(vertical: 128.0),
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Text('This list has no goals'),
              Text('Why?'),
            ]))
      ])),
    );
  }
}
