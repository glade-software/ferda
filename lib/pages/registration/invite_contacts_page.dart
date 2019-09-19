import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ferda/widgets/PromptedInput.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

//InputNum, code and group should be fairly straightforward.
class InviteContactsPage extends StatefulWidget {
  @override
  InviteContactsPageState createState() {
    return InviteContactsPageState();
  }
}

class InviteContactsPageState extends State<InviteContactsPage> {
  @override
  Widget build(BuildContext context) {
    return PromptedInput(
        titleText: "Invite your Squad",
        promptText: 'Invite your friends to the squad!',
        placeholderText: 'Eat breakfast',
        onButtonPress: null,
        hideAppBar: true,
        submitText: 'Submit');
  }
}
