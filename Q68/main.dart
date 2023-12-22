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
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Context Menu Example'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            // Add a context menu to each list item
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                _handleContextMenuSelection(value, index);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                  PopupMenuItem<String>(
                    value: 'view',
                    child: Text('View'),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ];
              },
            ),
          );
        },
      ),
    );
  }

  void _handleContextMenuSelection(String value, int index) {
    switch (value) {
      case 'edit':
        _editItem(index);
        break;
      case 'view':
        _viewItem(index);
        break;
      case 'delete':
        _deleteItem(index);
        break;
    }
  }

  void _editItem(int index) {
    // Perform edit operation on the selected item
    print('Edit item: ${items[index]}');
  }

  void _viewItem(int index) {
    // Perform view operation on the selected item
    print('View item: ${items[index]}');
  }

  void _deleteItem(int index) {
    // Perform delete operation on the selected item
    setState(() {
      items.removeAt(index);
    });
    print('Delete item: ${items[index]}');
  }
}
