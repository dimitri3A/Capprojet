import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LiveStream extends StatefulWidget {
  const LiveStream({Key? key, required this.url}) : super(key: key);
  final String? url;
  @override
  _LiveStreamState createState() => _LiveStreamState();
}

class _LiveStreamState extends State<LiveStream> {
  String liveUrl = "";
  @override
  void initState() {
    setState(() {
      liveUrl = widget.url.toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Live Call"),
          centerTitle: true,
        ),
        body: const WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: "",
        ));
  }
}
