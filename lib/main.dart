import 'package:flutter/material.dart';
import 'src/messages.g.dart'; // Import the generated Pigeon file

void main() {
  runApp(DestinationApp());
}

class DestinationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destination App',
      home: DestinationHomePage(),
    );
  }
}

class DestinationHomePage extends StatefulWidget {
  @override
  _DestinationHomePageState createState() => _DestinationHomePageState();
}

class _DestinationHomePageState extends State<DestinationHomePage>
    implements MessageFlutterApi {
  String _imageUrl = "https://picsum.photos/200/300?grayscale";

  @override
  void initState() {
    super.initState();

    MessageFlutterApi.setUp(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Destination App"),
      ),
      body: Center(
        child: Image.network(_imageUrl),
      ),
    );
  }

  @override
  String flutterMethod(String? aString) {
    setState(() {
      _imageUrl = aString!;
    });
    return '';
  }
}
