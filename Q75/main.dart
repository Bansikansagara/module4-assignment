import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lifecycle Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LifecycleExample(),
    );
  }
}

class LifecycleExample extends StatefulWidget {
  @override
  _LifecycleExampleState createState() => _LifecycleExampleState();
}

class _LifecycleExampleState extends State<LifecycleExample> {
  @override
  void initState() {
    super.initState();
    showToast("onCreate");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showToast("onStart");
  }

  @override
  Widget build(BuildContext context) {
    showToast("onResume");
    return Scaffold(
      appBar: AppBar(
        title: Text('Lifecycle Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showToast("Button Clicked");
          },
          child: Text('Show Toast'),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    showToast("onPause");
    super.deactivate();
  }

  @override
  void dispose() {
    showToast("onDestroy");
    super.dispose();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
