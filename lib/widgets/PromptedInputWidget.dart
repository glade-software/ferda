import 'package:flutter/material.dart';

//to serve as a input mechanism for phone number, code, etc. 
class PromptedInputWidget extends StatefulWidget{

  //TODO: Things that need to be generalized:

  // wait, these shouldnt be part of state, because they are immutable - not like they wil be changed

  // title text
  // prompt text
  // placeholder text indicating data format
  // function to cehck validity of input. 
  // on button press method

  PromptedInputWidget({this.titleText});

  final String titleText;// how does this get to build method scope?



  @override
  _PromptedInputWidgetState createState() => _PromptedInputWidgetState();
}

class _PromptedInputWidgetState extends State<PromptedInputWidget> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          
        title: Text(widget.titleText),
      ),
      body: Center(
        child: Text("List of goals of the group displayed here."),
      )
    );

  }
}