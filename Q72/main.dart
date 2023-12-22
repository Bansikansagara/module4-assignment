import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Call App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhoneCallScreen(),
    );
  }
}

class PhoneCallScreen extends StatefulWidget {
  @override
  _PhoneCallScreenState createState() => _PhoneCallScreenState();
}

class _PhoneCallScreenState extends State<PhoneCallScreen> {
  @override
  void initState() {
    super.initState();
    _checkAndRequestPhoneCallPermission();
  }

  Future<void> _checkAndRequestPhoneCallPermission() async {
    if (await Permission.phone.isGranted) {
      // Phone call permission is already granted
      print('Phone call permission is already granted.');
    } else {
      // Phone call permission has not been granted yet
      await _requestPhoneCallPermission();
    }
  }

  Future<void> _requestPhoneCallPermission() async {
    final PermissionStatus status = await Permission.phone.request();
    if (status == PermissionStatus.granted) {
      // Phone call permission granted by the user
      print('Phone call permission granted.');
    } else {
      // Phone call permission denied by the user
      print('Phone call permission denied.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Call App'),
      ),
      body: Center(
        child: Text('Welcome to the Phone Call App!'),
      ),
    );
  }
}
