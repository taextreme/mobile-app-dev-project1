import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:mobile_app_dev_project1/component/base_card.dart';

class DataScreen extends StatefulWidget {
  const DataScreen(
      {Key? key,
      required this.name,
      required this.dataMap,
      required this.cardColor})
      : super(key: key);

  final String name;
  final Map<String, String> dataMap;
  final Color cardColor;

  @override
  State<StatefulWidget> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  late SearchBar searchBar;
  late Map<String, String> data;

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        title: Text(widget.name),
        actions: [searchBar.getSearchAction(context)]);
  }

  void onSubmitted(String value) {
    setState(() {
      data = searchMap(value);
    });
  }

  @override
  void initState() {
    super.initState();
    searchBar = SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: onSubmitted,
        buildDefaultAppBar: buildAppBar);
    data = widget.dataMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: data.entries.map((entry) {
          var w = BaseCard(
              theColor: widget.cardColor,
              theChild: Column(children: <Widget>[
                const SizedBox(
                  height: 30.0,
                ),
                Text(entry.key,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold)),
                Text(entry.value, style: const TextStyle(fontSize: 26))
              ]));
          return w;
        }).toList(),
      ),
    );
  }

  Map<String, String> searchMap(String input) {
    if (input.isEmpty) {
      return widget.dataMap;
    }
    Map<String, String> result = {};
    widget.dataMap.forEach((key, value) {
      if (key.contains(input)) {
        result[key] = value;
      }
    });
    return result;
  }
}
