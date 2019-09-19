import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ferda/widgets/PromptedInput.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

//InputNum, code and group should be fairly straightforward.
class SetGoalPage extends StatefulWidget {
  @override
  SetGoalPageState createState() {
    return SetGoalPageState();
  }
}

class SetGoalPageState extends State<SetGoalPage> {
  @override
  Widget build(BuildContext context) {
    return PromptedInput(
        titleText: 'Set a Daily Goal',
        promptText: 'Set a Daily Goal',
        placeholderText: 'Eat breakfast',
        onButtonPress: null,
        hideAppBar: true,
        submitText: 'Submit');
  }
}
