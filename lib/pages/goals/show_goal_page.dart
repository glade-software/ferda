import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// View a goal from a member in your group
class ShowGoalPage extends StatefulWidget {
  @override
  ShowGoalPageState createState() {
    return ShowGoalPageState();
  }
}

class ShowGoalPageState extends State<ShowGoalPage> {
  @override
  Widget build(BuildContext context) {
    return Text('Matt has "ate breakfast" every day for 8 days!');
  }
}
