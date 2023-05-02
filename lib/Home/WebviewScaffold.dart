import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url:
          "https://drive.google.com/file/d/1wYA97hljFrWkMYZfMB1vUsKPFM8H1r2S/view?usp=sharing",
      appBar: new AppBar(
        title: new Text("My Resume"),
      ),
      withZoom: true,
      withLocalStorage: true,
      // hidden: true,
      allowFileURLs: true,
      initialChild: Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
