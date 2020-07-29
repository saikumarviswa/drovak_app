import 'package:flutter/material.dart';

class Item {
  const Item(this.name,this.icon);
  final String name;
  final Icon icon;
}
List<Item> vehicles = <Item>[
  const Item('Two Weeler',Icon(Icons.motorcycle,color:  const Color(0xFF167F67),)),
  const Item('Three weeler',Icon(Icons.airport_shuttle,color:  const Color(0xFF167F67),)),
  const Item('Four Weeler',Icon(Icons.directions_car,color:  const Color(0xFF167F67),)),
  const Item('Other',Icon(Icons.directions_bus,color:  const Color(0xFF167F67),)),
];

List<Item> companys = <Item>[
  const Item('Honda',Icon(Icons.directions_car,color:  const Color(0xFF167F67),)),
  const Item('Tata',Icon(Icons.directions_car,color:  const Color(0xFF167F67),)),
  const Item('KTM',Icon(Icons.motorcycle,color:  const Color(0xFF167F67),)),
  const Item('Volvo',Icon(Icons.directions_bus,color:  const Color(0xFF167F67),)),
  const Item('Other',Icon(Icons.directions_bus,color:  const Color(0xFF167F67),)),
];

List<Item> users = <Item>[
  const Item('Two Weeler',Icon(Icons.motorcycle,color:  const Color(0xFF167F67),)),
  const Item('Three weeler',Icon(Icons.airport_shuttle,color:  const Color(0xFF167F67),)),
  const Item('Four Weeler',Icon(Icons.directions_car,color:  const Color(0xFF167F67),)),
  const Item('Other',Icon(Icons.directions_bus,color:  const Color(0xFF167F67),)),
];