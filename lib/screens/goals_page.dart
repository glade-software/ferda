import 'package:ferda/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ferda/main.dart';

class GoalsPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    //I wonder if I can put logic here, as the widget is building? try

    final myFuture = isSignedIn();

    //with the way this is coded, the return Center block below actually executes first, before future thing is received and executed. 
    myFuture.then((status){
      if(status== false)
        Navigator.push(
          context, 
          //I want to keep the main.dart app bar and title I think, just want to swap body? need to figure that out. 
          MaterialPageRoute(
            builder: (context) => Scaffold( body: RegisterForm())
            
          )
        );
    }
    );
        
    //placeholder text widget until implement this page
    return Center(
      child: Text("List of goals of the group displayed here."),
    );
  }

  Future<bool> isSignedIn() async{

    //when I run with the below line, should make me go to register screen
    // FirebaseAuth.instance.signOut();

    //am I using await / future / async correctly? why are they needed, what would happen if removed.

    // Try without try catch block.. curious if works. 

    try{
      if (await FirebaseAuth.instance.currentUser() != null)
        return true;
    } catch(e){
      print(e.message);
    }

    return false;
  }

}