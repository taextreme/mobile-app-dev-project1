import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_app_dev_project1/data/numbers_data.dart';
import 'package:mobile_app_dev_project1/screen/data_screen.dart';

import '../component/base_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMERGENCY NUMBERS'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <BaseCard>[
          BaseCard(
            theColor: Colors.brown,
            theChild: const Align(
              alignment: Alignment.center,
              child: Text(
                'Police',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            theOnTapFunc: () {
              log("Call the Police!!!");
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DataScreen(
                    name: "Police Numbers",
                    dataMap: policeNumbers,
                    cardColor: Colors.brown);
              }));
            },
          ),
          BaseCard(
              theColor: Colors.orange,
              theChild: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Travelling Emergency',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              theOnTapFunc: () {
                log("Traffic!!!!");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DataScreen(
                      name: "Travelling Support Numbers",
                      dataMap: travelNumbers,
                      cardColor: Colors.orange);
                }));
              }),
          BaseCard(
            theColor: Colors.lightGreen,
            theChild: const Align(
              alignment: Alignment.center,
              child: Text(
                'Covid-19 Pandemic Support',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            theOnTapFunc: () {
              log("Covid Covid!!!!");
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DataScreen(
                    name: "Pandemic Support Numbers",
                    dataMap: pandemicNumbers,
                    cardColor: Colors.lightGreen);
              }));
            },
          ),
          BaseCard(
              theColor: Colors.grey,
              theChild: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Medical Emergency',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              theOnTapFunc: () {
                log("Ambulance!!!!");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DataScreen(
                      name: "Medical Emergency Numbers",
                      dataMap: medicalNumbers,
                      cardColor: Colors.grey);
                }));
              }),
          BaseCard(
              theColor: Colors.red,
              theChild: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Disaster Control',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              theOnTapFunc: () {
                log("Disaster!!!!");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DataScreen(
                      name: "Disaster Control Numbers",
                      dataMap: disasterNumbers,
                      cardColor: Colors.red);
                }));
              }),
          BaseCard(
              theColor: Colors.yellow,
              theChild: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Public Utilities Emergency',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              theOnTapFunc: () {
                log("Public Utilities!!!!");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DataScreen(
                      name: "Public Utilities Numbers",
                      dataMap: publicUtilitiesNumbers,
                      cardColor: Colors.yellow);
                }));
              }),
          BaseCard(
              theColor: Colors.blue,
              theChild: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Coastal & Maritime Emergency',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              theOnTapFunc: () {
                log("Coastguard!!!!");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DataScreen(
                      name: "Coastal & Maritime Numbers",
                      dataMap: coastalNumbers,
                      cardColor: Colors.blue);
                }));
              }),
          BaseCard(
              theColor: Colors.teal,
              theChild: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Emergency Radio Stations',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              theOnTapFunc: () {
                log("Radio!!!!");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DataScreen(
                      name: "Emergency Radio Numbers",
                      dataMap: radioNumbers,
                      cardColor: Colors.teal);
                }));
              })
        ],
      ),
    );
  }
}
