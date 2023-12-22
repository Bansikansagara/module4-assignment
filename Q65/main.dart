import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp65 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScopeExample(),
    );
  }
}

class WillPopScopeExample extends StatefulWidget {
  @override
  _WillPopScopeExampleState createState() => _WillPopScopeExampleState();
}

class _WillPopScopeExampleState extends State<WillPopScopeExample> {
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you really want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exit App Example'),
        ),
        body: Center(
          child: Text('Press back to exit the app'),
        ),
      ),
    );
  }
}
