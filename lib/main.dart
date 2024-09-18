import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class _DestinationHomePageState extends State<DestinationHomePage> {
  static const platform = MethodChannel('com.example.destination_app/navigate');
  String _receivedMessage =
      "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg";

  @override
  void initState() {
    super.initState();
    _getDeepLinkMessage();
  }

  @override
  Widget build(BuildContext context) {
    print(_receivedMessage);
    return Scaffold(
      appBar: AppBar(
        title: Text("Destination App"),
      ),
      body: Center(
          // child: Text("Received Message: $_receivedMessage"),
          child: Image.network(_receivedMessage)),
    );
  }

  Future<void> _getDeepLinkMessage() async {
    platform.setMethodCallHandler((call) async {
      if (call.method == "passMessage") {
        final message = call.arguments as String;
        setState(() {
          _receivedMessage = message;
        });
      }
    });
  }
}
