import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HotelApp(),
    );
  }
}

class HotelApp extends StatefulWidget {
  @override
  _HotelAppState createState() => _HotelAppState();
}

class _HotelAppState extends State<HotelApp> {
  List<String> cities = ['City 1', 'City 2', 'City 3'];
  String selectedCity = 'City 1';
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel App'),
        actions: [
          _buildCityDropdown(),
          _buildSearchTextField(),
        ],
      ),
      body: Center(
        child: Text('Hotel Listings will be displayed here.'),
      ),
    );
  }

  Widget _buildCityDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: selectedCity,
        onChanged: (String newValue) {
          setState(() {
            selectedCity = newValue;
          });
        },
        items: cities.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200.0, // Adjust the width as needed
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search hotels...',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            // Handle search functionality here
          },
        ),
      ),
    );
  }
}
