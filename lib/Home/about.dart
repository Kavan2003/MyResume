import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('About Me'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 75,
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu0IHMCdTv3N3pa7IEpCPkARQtc_Vazg5aKU7aNwehWA&s',
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'My Name',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'I am a software developer with a passion for creating elegant and efficient code. I have experience working with a variety of programming languages and frameworks, and I am always looking for new challenges and opportunities to learn.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          //go back button
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(05),
              // textStyle:
              // backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              '<-Go Back',
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
