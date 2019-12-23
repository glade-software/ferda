import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ferda/widgets/PromptedInput.dart';
import 'package:ferda/pages/registration/input_phone_number_page.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;

String _message = '';
String _verificationId;

class InputVerificationCodePage extends StatefulWidget {
  @override
  InputVerificationCodePageState createState() {
    return InputVerificationCodePageState();
  }
}

class InputVerificationCodePageState extends State<InputVerificationCodePage> {
  @override
  Widget build(BuildContext context) {

    //args.message contains the phone number
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    //pass phone number to the method that verfies phone number
    //because this is async, will i have to wait until the code is sent to google services, etc before the widget is actually drawn?
    _verifyPhoneNumber(args.message);

    return PromptedInput(
      //setting the title text here just to confirm the data is passign through
      titleText: 'Ferda Login',
      promptText: 'Enter your verification code',
      placeholderText: 'xxxxxx',
      onButtonPress: null,
      submitText: 'Submit',
    );
  }

    // Example code of how to verify phone number
  void _verifyPhoneNumber(String inputtedNumber) async {
    setState(() {
      _message = '';
    });

    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
      setState(() {

        _message = 'Received phone auth credential: $phoneAuthCredential';
        print(_message);
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      setState(() {
        _message =
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
        print(_message);
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
    //well, phone num should have to be valid anyways.
    await _auth.verifyPhoneNumber(
        phoneNumber: inputtedNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  // // Example code of how to sign in with phone.
  // void _signInWithPhoneNumber() async {
  //   final AuthCredential credential = PhoneAuthProvider.getCredential(
  //     verificationId: _verificationId,
  //     smsCode: _smsController.text,
  //   );
  //   final FirebaseUser user =
  //       (await _auth.signInWithCredential(credential)).user;
  //   final FirebaseUser currentUser = await _auth.currentUser();
  //   assert(user.uid == currentUser.uid);
  //   setState(() {
  //     if (user != null) {
  //       _message = 'Successfully signed in, uid: ' + user.uid;
  //     } else {
  //       _message = 'Sign in failed';
  //     }
  //   });
  // }
}




