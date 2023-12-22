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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multimedia App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Multimedia App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GalleryTab(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.music_note),
              title: Text('Audio'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AudioTab(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Video'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoTab(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to Multimedia App!'),
      ),
    );
  }
}

class GalleryTab extends StatelessWidget {
  final List<String> galleryItems = List.generate(10, (index) => 'Image $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: ListView.builder(
        itemCount: galleryItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(galleryItems[index]),
          );
        },
      ),
    );
  }
}

class AudioTab extends StatelessWidget {
  final List<String> audioItems = List.generate(10, (index) => 'Audio $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio'),
      ),
      body: ListView.builder(
        itemCount: audioItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(audioItems[index]),
          );
        },
      ),
    );
  }
}

class VideoTab extends StatelessWidget {
  final List<String> videoItems = List.generate(10, (index) => 'Video $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
      ),
      body: ListView.builder(
        itemCount: videoItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(videoItems[index]),
          );
        },
      ),
    );
  }
}
