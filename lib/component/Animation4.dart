import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Animation4 extends StatefulWidget {
  Animation4({Key key}) : super(key: key);

  @override
  _Animation4State createState() => _Animation4State();
}

class _Animation4State extends State<Animation4> {
  bool _isFlag = false;
  double _opacity = 0.5;
  double _padding = 50;
  String _path = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.createFileOfPdfUrl().then((File file) {
      this.setState(() {
        print("123");
        _path = file.path;
      });
    });
  }

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    try {
      final url = "http://lvxiaochui.com/ddd.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
    return completer.future;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("123"),
      ),
      body: Container(
        child: Column(children: [
          Row(children:[
            Container(
              child: Text("123")
              ),
            Text("123"),
          ])
        ],),
      ),
    );
  }
}
