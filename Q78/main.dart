import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListViewExample(),
    );
  }
}

class ListViewExample extends StatefulWidget {
  @override
  _ListViewExampleState createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  List<String> names = [];
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter Name',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _addName();
                  },
                  child: Text('Add Name'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(names[index]),
                  onTap: () {
                    _showNameDialog(names[index]);
                  },
                  onLongPress: () {
                    _showContextMenu(context, index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addName() {
    String name = _nameController.text.trim();
    if (name.isNotEmpty) {
      setState(() {
        names.add(name);
        _nameController.clear();
      });
    }
  }

  void _showNameDialog(String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Selected Name'),
        content: Text(name),
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

  void _showContextMenu(BuildContext context, int index) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        TapDownDetails(globalPosition: overlay.globalToLocal(overlay.localToGlobal(Offset.zero))) as Rect,
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem(
          value: 'edit',
          child: ListTile(
            title: Text('Edit Item'),
            onTap: () {
              Navigator.pop(context);
              _editItem(index);
            },
          ),
        ),
        PopupMenuItem(
          value: 'delete',
          child: ListTile(
            title: Text('Delete Item'),
            onTap: () {
              Navigator.pop(context);
              _confirmDeleteItem(index);
            },
          ),
        ),
      ],
    );
  }

  void _editItem(int index) {
    String currentName = names[index];

    showDialog(
      context: context,
      builder: (context) {
        TextEditingController editController = TextEditingController(text: currentName);

        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(
              hintText: 'Enter Updated Name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  names[index] = editController.text.trim();
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteItem(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure want to delete item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  names.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
