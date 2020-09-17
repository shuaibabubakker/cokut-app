import 'package:cokut/services/api.dart';
import 'package:cokut/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key key, this.toggle}) : super(key: key);
  final Function toggle;

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String phone;
  String name;
  String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(30),
            child: Text(
              "Register",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
          CustomTextFormField(
            hintText: "Full Name",
            textInputType: TextInputType.name,
            validator: (val) {
              if (val.length == 0) {
                return "Should not be empty";
              }
              return null;
            },
            onChanged: (val) {
              name = val;
            },
          ),
          CustomTextFormField(
            hintText: "Phone",
            textInputType: TextInputType.phone,
            validator: (val) {
              if (val.length != 10) {
                return "Please enter a valid mobile number";
              }
              return null;
            },
            onChanged: (val) {
              phone = val;
            },
          ),
          CustomTextFormField(
            hintText: "Email (Optional)",
            textInputType: TextInputType.emailAddress,
            validator: (String val) {
              if (!(val.contains('@') && val.contains('.'))) {
                return "Enter a valid email address";
              }
              return null;
            },
            onChanged: (val) {
              email = val;
            },
          ),
          RaisedButton(
            onPressed: () {
              Function({String content}) showWarning = ({String content}) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      content ?? "Please Check Your Internet Connectivity",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              };
              print("Register Pressed");
              if (_formKey.currentState.validate()) {
                api
                    .registerUser(name: name, email: email, phone: phone)
                    .then((value) {
                  print(value.data);
                  if (!value.data["success"]) {
                    showWarning(content: value.data["msg"] as String);
                  } else {
                    showWarning(content: "Successful");
                  }
                });
              }
            },
            color: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textColor: Colors.white,
            child: Text("Register"),
          ),
          Spacer(),
          FlatButton(
            onPressed: widget.toggle,
            child: Text("Already have an account ? Sign In"),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}