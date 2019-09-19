import 'package:flutter/material.dart';

//to serve as a input mechanism for phone number, code, etc. 
class PromptedInput extends StatefulWidget{

  //TODO: Things that need to be generalized:

  // wait, these shouldnt be part of state, because they are immutable - not like they wil be changed

  // title text
  // prompt text
  // placeholder text indicating data format
  // on button press method (check input is valid also)

  PromptedInput({this.titleText,this.promptText,this.placeholderText,this.onButtonPress,this.submitText});

  final String titleText;
  final String promptText;
  final String placeholderText;
  final Function onButtonPress;
  //TODO: inject validator
  final String submitText;


  @override
  _PromptedInputState createState() => _PromptedInputState();
}

class _PromptedInputState extends State<PromptedInput> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          
        title: Text(widget.titleText),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(widget.promptText),
            TextFormField(
                //do I need to add a custom controller as an instance variable?
                // controller: _phoneNumberController,
                decoration:
                    InputDecoration(labelText: widget.placeholderText),
                validator: (String value) {
                  if (value.isEmpty) {
                    return widget.placeholderText;
                  }
                  return null;
                },
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: widget.onButtonPress,
                child: Text(widget.submitText),
              ),
            ),
          ],
        ),
      )
    );

  }
}