import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ferda/widgets/PromptedInput.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

//InputNum, code and group should be fairly straightforward.
class SetGroupNamePage extends StatefulWidget {
  @override
  SetGroupNamePageState createState() {
    return SetGroupNamePageState();
  }
}

class SetGroupNamePageState extends State<SetGroupNamePage> {
  @override
  Widget build(BuildContext context) {
    return PromptedInput(
      titleText: 'Choose a group name!',
      promptText: 'Name your crew',
      placeholderText: 'SauceSquad',
      onButtonPress: null,
      submitText: 'Submit',
      hideAppBar: true,
    );
  }
}
