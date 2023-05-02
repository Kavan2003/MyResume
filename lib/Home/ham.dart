import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'WebviewScaffold.dart';
import 'about.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HamburgerOverlay extends StatelessWidget {
  final VoidCallback onClose;

  const HamburgerOverlay({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose,
      child: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 40, 40, 40),
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text('About Me', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle About Me option
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutMe()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.download, color: Colors.white),
                title: Text('Download Resume',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle Download Resume option
                  //go to the link

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyWebView()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.work, color: Colors.white),
                title:
                    Text('My Projects', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle My Projects option
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
