import 'package:flutter/material.dart';
import 'package:tiktok_getx/views/screens/add/add_video.dart';

// Colors
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// BottomNavigationBar pages
const pages = [
  Center(child: Text("Home")),
  Center(child: Text("Search")),
  AddVideoScreen(),
  Center(child: Text("Message")),
  Center(child: Text("Profile")),
];
