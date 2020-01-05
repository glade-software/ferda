import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ferda/widgets/PromptedInput.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

String _message = ''; //this was used for debugging in example, can likely remove. 
String _verificationId;

class InputPhonePage extends StatefulWidget {
  @override
  InputPhonePageState createState() {
    return InputPhonePageState();
  }
}

class ScreenArguments {
  final String message;

  ScreenArguments(this.message);
}

class InputPhonePageState extends State<InputPhonePage> {

  String testText = "";
  final TextEditingController _inputTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PromptedInput(
        titleText: 'We will not post this data',
        promptText: 'Enter your phone number',
        placeholderText: '+1 (xxx) xxx-xxxx',
        submitText: 'Submit',
        hideAppBar: true,
        inputTextController: _inputTextController,
        //run validator of tet input changed - ca be handled in class
        validator: (value){
          if(value.isEmpty){
            return "";
          } 
          return null;
        },
        //this function will only be applied if the input field is valid
        onButtonPress: (){
          Navigator.pushNamed(
            context, 
            '/registration/verification',
            arguments: ScreenArguments(_inputTextController.text)
          );
        });
  }

  // void _verifyPhoneNumber() async {
  //   setState(() {
  //     _message = '';
  //   });

  //   final PhoneVerificationCompleted verificationCompleted =
  //       (AuthCredential phoneAuthCredential) {
  //     _auth.signInWithCredential(phoneAuthCredential);
  //     setState(() {

  //       _message = 'Received phone auth credential: $phoneAuthCredential';
  //     });
  //   };

  //   final PhoneVerificationFailed verificationFailed =
  //       (AuthException authException) {
  //     setState(() {
  //       _message =
  //           'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
  //     });
  //   };

  //   final PhoneCodeSent codeSent =
  //       (String verificationId, [int forceResendingToken]) async {
  //     // widget._scaffold.showSnackBar(SnackBar(
  //     //   content:
  //     //       const Text('Please check your phone for the verification code.'),
  //     // ));
  //     print('verification code sent');
  //     print(verificationId);
  //     _verificationId = verificationId;
  //   };

  //   final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
  //       (String verificationId) {
  //     _verificationId = verificationId;
  //   };

  //   //Throws exeption when _phoneNumberController.text is empty
  //   //TODO: handle this exception
  //   await _auth.verifyPhoneNumber(
  //       phoneNumber: _phoneNumberController.text,
  //       timeout: const Duration(seconds: 5),
  //       verificationCompleted: verificationCompleted,
  //       verificationFailed: verificationFailed,
  //       codeSent: codeSent,
  //       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  // }

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

//this one was global
// final FirebaseAuth _auth = FirebaseAuth.instance;

// String _message = '';
// String _verificationId;

//   // Example code of how to verify phone number
//   void _verifyPhoneNumber() async {
//     setState(() {
//       _message = '';
//     });

//     final PhoneVerificationCompleted verificationCompleted =
//         (AuthCredential phoneAuthCredential) {
//       _auth.signInWithCredential(phoneAuthCredential);
//       setState(() {
//         //can we add view switch here?

//         _message = 'Received phone auth credential: $phoneAuthCredential';
//       });
//     };

//     final PhoneVerificationFailed verificationFailed =
//         (AuthException authException) {
//       setState(() {
//         _message =
//             'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
//       });
//     };

//     final PhoneCodeSent codeSent =
//         (String verificationId, [int forceResendingToken]) async {
//       // widget._scaffold.showSnackBar(SnackBar(
//       //   content:
//       //       const Text('Please check your phone for the verification code.'),
//       // ));
//       print('verification code sent');
//       print(verificationId);
//       _verificationId = verificationId;
//     };

//     final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//         (String verificationId) {
//       _verificationId = verificationId;
//     };

//     //Throws exeption when _phoneNumberController.text is empty
//     //TODO: handle this exception
//     await _auth.verifyPhoneNumber(
//         phoneNumber: _phoneNumberController.text,
//         timeout: const Duration(seconds: 5),
//         verificationCompleted: verificationCompleted,
//         verificationFailed: verificationFailed,
//         codeSent: codeSent,
//         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//   }

//   // Example code of how to sign in with phone.
//   void _signInWithPhoneNumber() async {
//     final AuthCredential credential = PhoneAuthProvider.getCredential(
//       verificationId: _verificationId,
//       smsCode: _smsController.text,
//     );
//     final FirebaseUser user =
//         (await _auth.signInWithCredential(credential)).user;
//     final FirebaseUser currentUser = await _auth.currentUser();
//     assert(user.uid == currentUser.uid);
//     setState(() {
//       if (user != null) {
//         _message = 'Successfully signed in, uid: ' + user.uid;
//       } else {
//         _message = 'Sign in failed';
//       }
//     });
//   }
// }
