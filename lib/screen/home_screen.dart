import 'dart:developer';

import 'package:flutter/material.dart';

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
            },
          ),
          BaseCard(
            theColor: Colors.red.shade800,
            theChild: const Align(
              alignment: Alignment.center,
              child: Text(
                'Fire',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            theOnTapFunc: () {
              log("Fire Fire!!!!");
            },
          ),
          BaseCard(
              theColor: Colors.orange,
              theChild: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Traffic Officers',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              theOnTapFunc: () {
                log("Traffic!!!!");
              }),
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
              }),
          BaseCard(
              theColor: Colors.lightGreen,
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
              }),
          BaseCard(
              theColor: Colors.blue,
              theChild: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Coastguard',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              theOnTapFunc: () {
                log("Coastguard!!!!");
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
              })
        ],
      ),
    );
  }
}
