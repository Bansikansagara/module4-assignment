import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCity = 'Select a city';

  // List of cities
  List<String> cities = ['New York', 'London', 'Tokyo', 'Paris', 'Berlin'];

  Future<void> _showCitySelectionDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a city'),
          content: SingleChildScrollView(
            child: ListBody(
              children: cities
                  .map((city) => RadioListTile<String>(
                title: Text(city),
                value: city,
                groupValue: selectedCity,
                onChanged: (value) {
                  setState(() {
                    selectedCity = value!;
                  });
                  Navigator.of(context).pop();
                },
              ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected City:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              selectedCity,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showCitySelectionDialog();
              },
              child: Text('Select City'),
            ),
          ],
        ),
      ),
    );
  }
}
