import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: TestScreen(),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<TestScreen> {
  final _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Form Test'),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'FirstName'
                ),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Please enter first name';
                  }
                  return null;
                },
                onSaved: (String? value){
                  firstName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'LastName'
                ),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Please enter last name';
                  }
                  return null;
                },
                onSaved: (String? value){
                  lastName = value;
                },
              )
            ],
          ),
        ),
        ElevatedButton(
            onPressed: (){
              if(_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                print('firstName: $firstName, lastName: $lastName');
              }
            },
            child: Text('Submit'))
      ],
    );
  }
}