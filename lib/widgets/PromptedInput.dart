import 'package:flutter/material.dart';

//to serve as a input mechanism for phone number, code, etc.
class PromptedInput extends StatefulWidget {
  //TODO: Things that need to be generalized:

  // wait, these shouldnt be part of state, because they are immutable - not like they wil be changed

  // title text
  // prompt text
  // placeholder text indicating data format
  // on button press method (check input is valid also)

  PromptedInput(
      {this.titleText,
      this.promptText,
      this.placeholderText,
      this.onButtonPress,
      this.onTextChanged,
      this.validator,
      // this.updateInputValid,
      this.submitText,
      this.hideAppBar, 
      this.inputTextController,
      this.isInputValid = false // Shouldn't need a variable here, can just read the button's state
      }); //is this where we put default values. 

  final String titleText;
  final String promptText;
  final String placeholderText;
  final String submitText;
  final Function onButtonPress;
  final Function onTextChanged;
  final Function validator;
  // final Function updateInputValid; // probably dont need this, logic can be handles in callback
  final bool hideAppBar;
  final TextEditingController inputTextController;

  bool isInputValid;
  //TODO: inject validator - What does this mean? 

  @override
  _PromptedInputState createState() => _PromptedInputState();
}

class _PromptedInputState extends State<PromptedInput> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final appBar =
        // widget.hideAppBar ? AppBar(title: Text(widget.titleText)) : null;

    // final inputTextController = TextEditingController();
    // inputTextController.addListener(widget.onTextChanged);

    
    
    return Scaffold(
        // appBar: null,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(widget.promptText),
              Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  TextFormField(
                  //do I need to add a custom controller as an instance variable?
                  //yes, also need to define it's callback function onchanged. 
                  //onchanged check validity, change button active or not 
                    controller: widget.inputTextController,
                    decoration: InputDecoration(labelText: widget.placeholderText),
                    validator: widget.validator,
                    onChanged: (text){
                      //run validator, if is valid, change button state
                      if(_formKey.currentState.validate()){
                        
                      }
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
                ])
              // TextFormField(
              //   //do I need to add a custom controller as an instance variable?
              //   //yes, also need to define it's callback function onchanged. 
              //   //onchanged check validity, change button active or not 
              //   controller: widget.inputTextController,
              //   decoration: InputDecoration(labelText: widget.placeholderText),
              //   // TODO: replace with widget.validator
              //   validator: (String value) {
              //     if (value.isEmpty) {
              //       return widget.placeholderText;
              //     }
              //     return null;
              //   },
              // ),
              // Container(
              //   padding: const EdgeInsets.symmetric(vertical: 16.0),
              //   alignment: Alignment.center,
              //   child: RaisedButton(
              //     onPressed: widget.onButtonPress,
              //     child: Text(widget.submitText),
              ),
          ],
        ),
      )
    );
  }

}
