import 'dart:convert';

import 'package:coronaupdateflutter/AllCountries.dart';
import 'package:coronaupdateflutter/MyCountry.dart';
import 'package:coronaupdateflutter/SafetyTips.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Global.dart';


class Home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  int _selectedTabIndex = 0;

  List _pages = [
    Global(),
    AllCountries(),
    MyCountry(),
    SafetyTips(),
  ];

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Coronavirus Updates"), backgroundColor: Colors.blueGrey),
      body: Center(
          child: _pages[_selectedTabIndex]),
      bottomNavigationBar: new Theme(
    data: Theme.of(context).copyWith(
    // sets the background color of the `BottomNavigationBar`
    canvasColor: Colors.blueGrey,
    // sets the active color of the `BottomNavigationBar` if `Brightness` is light
    primaryColor: Colors.red,
    textTheme: Theme
        .of(context)
        .textTheme
        .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
    child: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _changeIndex,
        showUnselectedLabels: true,
        fixedColor: Colors.blueAccent,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.language), title: Text("Global")),
          BottomNavigationBarItem(
              icon: Icon(Icons.map), title: Text("All Countries")),
          BottomNavigationBarItem(
              icon: Icon(Icons.assistant_photo), title: Text("My Country")),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new), title: Text("Safety Tips")),
        ],
      ),
      )
    );
  }
}
