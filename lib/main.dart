import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

//ref: https://pub.dev/packages/firebase_auth
Future<FirebaseUser> _handleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

  print("signed in " + user.displayName);
  return user;
}

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
      initialRoute: '/invite',
      routes: {
        '/login': (ctx) => LoginForm(),
        '/invite': (ctx) => Invite(),
      },

      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: LoginForm(),
      )
    );
  }
}


//Login Form widget
class LoginForm extends StatefulWidget{

  @override
  LoginFormState createState(){
    return LoginFormState();
  }
}

//form is the widget, state is its state
class LoginFormState extends State<LoginForm>{


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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: const Text('Test sign in with phone number'),
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
        ),
        TextFormField(
          controller: _phoneNumberController,
          decoration:
              InputDecoration(labelText: 'Phone number (+x xxx-xxx-xxxx)'),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Phone number (+x xxx-xxx-xxxx)';
            }
            return null;
          },
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          alignment: Alignment.center,
          child: RaisedButton(
            onPressed: () async {
              _verifyPhoneNumber();
            },
            child: const Text('Verify phone number'),
          ),
        ),
        TextField(
          controller: _smsController,
          decoration: InputDecoration(labelText: 'Verification code'),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          alignment: Alignment.center,
          child: RaisedButton(
            onPressed: () async {
              _signInWithPhoneNumber();
            },
            child: const Text('Sign in with phone number'),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            _message,
            style: TextStyle(color: Colors.red),
          ),
        )
      ],
    );
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