import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ferda/widgets/PromptedInputWidget.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

//TODO: put all the pages of the register flow in this file, to keep things simple now. one shared state.

//Login Form widget
class RegisterForm extends StatefulWidget{

  @override
  RegisterFormState createState(){
    return RegisterFormState();
  }
}

//form is the widget, state is its state
class RegisterFormState extends State<RegisterForm>{


  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  @override
  void initState(){
    super.initState();


  }

  String _message = '';
  String _verificationId;

  @override
  Widget build(BuildContext context) {
    
    //How to handle routing between the subpages
    return InputNumber();
  }

  // Example code of how to verify phone number
  void _verifyPhoneNumber() async {
    setState(() {
      _message = '';
    });

    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        //can we add view switch here?


        _message = 'Received phone auth credential: $phoneAuthCredential';
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      setState(() {
        _message =
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      // widget._scaffold.showSnackBar(SnackBar(
      //   content:
      //       const Text('Please check your phone for the verification code.'),
      // ));
      print('verification code sent');
      print(verificationId);
      _verificationId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    //Throws exeption when _phoneNumberController.text is empty
    //TODO: handle this exception
    await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  // Example code of how to sign in with phone.
  void _signInWithPhoneNumber() async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: _verificationId,
      smsCode: _smsController.text,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        _message = 'Successfully signed in, uid: ' + user.uid;
      } else {
        _message = 'Sign in failed';
      }
    });
  }
}

//InputNum, code and group should be fairly straightforward.
//Do these need to be stateful?
class InputNumber extends PromptedInputWidget{

}

class InputCode extends PromptedInputWidget{

}

class InputGroup extends PromptedInputWidget{

}

//TODO this page should let you select contacts from a list
// so need to figure out how to ask user for contacts persmissions, and dispaly a list to them
// Alternatively, could have user enter their friends number?
class SelectContacts extends StatefulWidget{

  @override
  _SelectContactsState createState() => _SelectContactsState();

}

class _SelectContactsState extends State<SelectContacts>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}