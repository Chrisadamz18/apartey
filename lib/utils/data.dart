import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var profile = "";

List populars = [
  {
    "image": "",
    "name": "Single room self-contain",
    "price": "GHC 180",
    "location": "Dome",
    "is_favorited": true,
  },
  {
    "image": "",
    "name": "Chamber & Hall",
    "price": "GHC 250",
    "location": "Lokoe",
    "is_favorited": false,
  },
  {
    "image": "",
    "name": "2 Bedroom self-contain",
    "price": "GHC 500",
    "location": "Dave",
    "is_favorited": false,
  },
  {
    "image": "",
    "name": "Standford Hostel",
    "price": "GHC 120",
    "location": "Poly",
    "is_favorited": false,
  },
];

List recommended = [
  {
    "image": "",
    "name": "Sathel Hostel",
    "price": "GHC 180 ",
    "location": "Nurses Training Junc.",
    "is_favorited": true,
  },
  {
    "image": "",
    "name": "Single room",
    "price": "GHC 200",
    "location": "Godzokpe",
    "is_favorited": false,
  },
  {
    "image": "",
    "name": "Single room with porch",
    "price": "GHC 180",
    "location": "Ahoe",
    "is_favorited": true,
  },
];

List recents = [
  {
    "image": "",
    "name": "2 Bedroom",
    "price": "GHC 300",
    "location": "Ahoe",
    "is_favorited": false,
  },
  {
    "image": "",
    "name": "Single room",
    "price": "GHC 70",
    "location": "Dome",
    "is_favorited": false,
  },
  {
    "image": "",
    "name": "Single room with porch",
    "price": "GHC 80",
    "location": "Dave",
    "is_favorited": false,
  },
];

List categories = [
  {"name": "All", "icon": FontAwesomeIcons.boxes},
  {"name": "Hotels", "icon": FontAwesomeIcons.university},
  // {"name": "Shop", "icon": FontAwesomeIcons.storeAlt},
  // {"name": "Real Estate Developers", "icon": FontAwesomeIcons.building},
  {"name": "Apartments", "icon": FontAwesomeIcons.home},
];

// var brokers = [
//   {
//     "image":
//         "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     "name": "John Siphron",
//     "type": "Broker",
//     "description":
//         "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
//     "rate": 4,
//   },
//   {
//     "image":
//         "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     "name": "Corey Aminoff",
//     "type": "Broker",
//     "description":
//         "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
//     "rate": 4,
//   },
//   {
//     "image":
//         "https://images.unsplash.com/photo-1617069470302-9b5592c80f66?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     "name": "Siriya Aminoff",
//     "type": "Broker",
//     "description":
//         "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
//     "rate": 4,
//   },
//   {
//     "image":
//         "https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     "name": "Rubin Joe",
//     "type": "Broker",
//     "description":
//         "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
//     "rate": 4,
//   },
// ];

// List companies = [
//   {
//     "image": "",
//     "name": "TS Home",
//     "location": "Phnom Penh, Cambodia",
//     "type": "Broker",
//     "is_favorited": false,
//     "icon": Icons.domain_rounded
//   },
//   {
//     "image": "",
//     "name": "Century 21",
//     "location": "Phnom Penh, Cambodia",
//     "type": "Broker",
//     "is_favorited": true,
//     "icon": Icons.house_siding_rounded
//   },
//   {
//     "image": "",
//     "name": "Dabest Pro",
//     "location": "Phnom Penh, Cambodia",
//     "type": "Broker",
//     "is_favorited": true,
//     "icon": Icons.home_work_rounded
//   },
//   {
//     "image": "",
//     "name": "Cam Reality",
//     "location": "Phnom Penh, Cambodia",
//     "type": "Broker",
//     "is_favorited": true,
//     "icon": Icons.location_city_rounded
//   },
// ];

class House {
  
  House({
    required this.id,
    required this.amount,
    required this.address,
  });

int id;
  String address;
  int amount;



}
