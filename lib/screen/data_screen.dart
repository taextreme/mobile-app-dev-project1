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
              theChild: Column(children: <Widget>[
                const SizedBox(
                  height: 30.0,
                ),
                Text(entry.key,
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                Text(entry.value, style: TextStyle(fontSize: 26))
              ]));
          return w;
        }).toList(),
      ),
    );
  }
}
