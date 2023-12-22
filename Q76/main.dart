import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sum Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputScreen(),
    );
  }
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sum Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter first number'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: secondNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter second number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _calculateSum();
              },
              child: Text('Calculate Sum'),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateSum() {
    if (firstNumberController.text.isNotEmpty &&
        secondNumberController.text.isNotEmpty) {
      // Parse the input values as doubles
      double firstNumber = double.parse(firstNumberController.text);
      double secondNumber = double.parse(secondNumberController.text);

      // Calculate the sum
      double sum = firstNumber + secondNumber;

      // Navigate to the ResultScreen with the calculated sum
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(sum: sum),
        ),
      );
    } else {
      // Display an error if the input fields are empty
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text('Please enter both numbers before calculating.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final double sum;

  ResultScreen({required this.sum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Text(
          'Sum: $sum',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
