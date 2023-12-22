import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multimedia App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Dummy data for each tab
  List<String> galleryItems = List.generate(10, (index) => 'Image $index');
  List<String> audioItems = List.generate(10, (index) => 'Audio $index');
  List<String> videoItems = List.generate(10, (index) => 'Video $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multimedia App'),
      ),
      body: _getCurrentTab(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Audio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'Video',
          ),
        ],
      ),
    );
  }

  Widget _getCurrentTab() {
    switch (_currentIndex) {
      case 0:
        return GalleryTab(items: galleryItems);
      case 1:
        return AudioTab(items: audioItems);
      case 2:
        return VideoTab(items: videoItems);
      default:
        return Container();
    }
  }
}

class GalleryTab extends StatelessWidget {
  final List<String> items;

  GalleryTab({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}

class AudioTab extends StatelessWidget {
  final List<String> items;

  AudioTab({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}

class VideoTab extends StatelessWidget {
  final List<String> items;

  VideoTab({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}
