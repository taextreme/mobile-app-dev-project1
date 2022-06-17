import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:mobile_app_dev_project1/component/base_card.dart';
import 'package:mobile_app_dev_project1/data/user_data.dart';
import 'package:mobile_app_dev_project1/screen/input_screen.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  late Map<String, dynamic> userData;
  late SearchBar searchBar;

  @override
  void initState() {
    super.initState();
    searchBar = SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: onSubmitted,
        onClosed: onClose,
        buildDefaultAppBar: buildAppBar);
    initUserData();
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        title: const Text('PERSONAL EMERGENCY NUMBERS'),
        actions: [searchBar.getSearchAction(context)]);
  }

  void onSubmitted(String value) {
    setState(() {
      userData = searchMap(value);
    });
  }

  void onClose() {
    setState(() {
      initUserData();
    });
  }

  void initUserData() {
    String encodeData = UserSimplePreferences.getUserdata();
    userData = json.decode(encodeData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: userData.entries.map((entry) {
          var w = BaseCard(
              theColor: Colors.green,
              theChild: Column(children: <Widget>[
                const SizedBox(
                  height: 30.0,
                ),
                Text(entry.key, style: const TextStyle(fontSize: 20)),
                Text(entry.value,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        userData.remove(entry.key);
                        String encodeData = jsonEncode(userData);
                        UserSimplePreferences.setUserData(encodeData);
                      });
                    },
                    child: const Icon(
                      Icons.delete_forever,
                      color: Colors.black,
                      size: 20.0,
                    ))
              ]));
          return w;
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const DataEntryScreen();
          })).then((_) => setState(() {
                String encodeData = UserSimplePreferences.getUserdata();
                userData = json.decode(encodeData);
              }));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  Map<String, dynamic> searchMap(String input) {
    if (input.isEmpty) {
      return userData;
    }
    Map<String, dynamic> result = {};
    userData.forEach((key, value) {
      if (key.toLowerCase().contains(input.toLowerCase())) {
        result[key] = value;
      }
    });
    return result;
  }
}
