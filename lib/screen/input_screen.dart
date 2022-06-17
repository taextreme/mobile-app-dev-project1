import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/user_data.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({Key? key}) : super(key: key);

  @override
  State<DataEntryScreen> createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  late Map<String, dynamic> userData;
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String number = "";

  @override
  void initState() {
    super.initState();
    initUserData();
  }

  void initUserData() {
    String encodeData = UserSimplePreferences.getUserdata();
    userData = json.decode(encodeData);
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Numbers Name',
                filled: true,
                isDense: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  name = value!;
                });
              },
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Number',
                  filled: true,
                  isDense: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    number = value!;
                  });
                }),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shadowColor: Colors.blueAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              onPressed: () {
                bool isValid = _formKey.currentState!.validate();
                if (isValid) {
                  _formKey.currentState!.save();
                  addNewData(name, number);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void addNewData(String name, String number) {
    userData[name] = number;
    String encodeData = jsonEncode(userData);
    UserSimplePreferences.setUserData(encodeData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Personal Emergency Number'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: _buildForm(),
      ),
    );
  }
}
