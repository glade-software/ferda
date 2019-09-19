import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ferda/main.dart';

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  void initState() {
    super.initState();

    final myFuture = isSignedIn();

    myFuture.then((status) {
      if (status == false)

        //its still showing back button
        // TODO: is there a way to replace page, rather than "push"
        Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    //I wonder if I can put logic here, as the widget is building? try
    print('in goals build');

    //placeholder text widget until implement this page

    // actually, kinda weird to wrap this in scaffold, because when page first loads, it

    return Scaffold(
        appBar: AppBar(
          //Do we actually need to title each page? what is the standard practice for UI?
          title: Text("Goals page title"),
        ),
        body: Center(
          child: Text("List of goals of the group displayed here."),
        ));

    // return Center(
    //   child: Text("List of goals of the group displayed here."),
    // );
  }

  Future<bool> isSignedIn() async {
    //when I run with the below line, should make me go to register screen
    FirebaseAuth.instance.signOut();

    //am I using await / future / async correctly? why are they needed, what would happen if removed.

    // Try without try catch block.. curious if works.

    try {
      if (await FirebaseAuth.instance.currentUser() != null) return true;
    } catch (e) {
      print(e.message);
    }

    return false;
  }
}
