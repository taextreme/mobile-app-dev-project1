import 'package:flutter/material.dart';
import 'package:mobile_app_dev_project1/component/base_card.dart';

class DataScreen extends StatelessWidget {
  const DataScreen(
      {required this.name, required this.dataMap, required this.cardColor});

  final String name;
  final Map<String, String> dataMap;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: dataMap.entries.map((entry) {
          var w = BaseCard(
              theColor: cardColor,
              theChild: Column(
                  children: <Widget>[Text(entry.key), Text(entry.value)]));
          return w;
        }).toList(),
      ),
    );
  }
}
