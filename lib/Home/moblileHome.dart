import 'package:flutter/material.dart';

// import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_social_button/flutter_social_button.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'contact.dart';
import 'ham.dart';

final Uri github = Uri.parse('https://github.com/Kavan2003');
final Uri link = Uri.parse('https://www.linkedin.com/in/kavanthosani/');
final Uri what = Uri.parse('https://wa.me/919408188812');

class PortfolioHome extends StatefulWidget {
  @override
  _PortfolioHomeState createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome>
    with SingleTickerProviderStateMixin {
  // final Email email = Email(
  //   // body: 'Email body',
  //   // subject: 'Email subject',
  //   recipients: ['kavanthosani2003@gmail.com'],
  //   // cc: ['cc@example.com'],
  //   // bcc: ['bcc@example.com'],
  //   // attachmentPaths: null,
  //   isHTML: false,
  // );
  // Future<void> send() async {
  //   final Email email = Email(
  //     // body: 'Email body',
  //     // subject: 'Email subject',
  //     recipients: ['kavanthosani2003@gmail.com'],
  //     // cc: ['cc@example.com'],
  //     // bcc: ['bcc@example.com'],
  //     // attachmentPaths: null,
  //     isHTML: false,
  //   );
  //   String platformResponse;

  //   try {
  //     await FlutterEmailSender.send(
  //       email,
  //     );
  //     platformResponse = 'success';
  //   } catch (error) {
  //     print(error);
  //     platformResponse = error.toString();
  //   }

  //   if (!mounted) return;

  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(platformResponse),
  //     ),
  //   );
  // }

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      Text('Could not launch $_url');
    }
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 56, 55, 55),
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.bars,
              color: Colors.white.withOpacity(0.87)),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return HamburgerOverlay(
                  onClose: () {
                    Navigator.of(context).pop();
                  },
                );
              },
            );
          },
        ),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 56, 55, 55),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu0IHMCdTv3N3pa7IEpCPkARQtc_Vazg5aKU7aNwehWA&s',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: GoogleFonts.openSans(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[700],
                  ),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TyperAnimatedText('Hey there! 👋'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  "Kavan Thosani",
                  style: GoogleFonts.roboto(
                    fontSize: 45,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 250.0,
                height: 40,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 35.0,
                    fontFamily: 'Canterbury',
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'Flutter Developer',
                        colors: [
                          Colors.blue.withOpacity(0.87),
                          Colors.blueAccent,
                          Colors.lightBlue,
                          Colors.cyanAccent,
                        ],
                        textStyle: GoogleFonts.roboto(
                          fontSize: 030,
                          fontWeight: FontWeight.w600,
                          // color: Colors.blue.withOpacity(0.87),
                        ),
                      ),
                      // ScaleAnimatedText('Web Developer'),
                      // ScaleAnimatedText('Android Developer'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // IconButton(
                  IconButton(
                    onPressed: () =>
                        //setState(() {
                        _launchUrl(github),
                    icon: const Icon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                    ),
                  ),
                  // size: 50,
                  IconButton(
                    onPressed: () => _launchUrl(link),
                    icon: const Icon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _launchUrl(what),
                    icon: const Icon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.white,
                      // size: 50,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // SizedBox(height: 20),
              ScaleTransition(
                scale: _fadeAnimation,
                child: SizedBox(
                  // width: double.infinity,
                  child: Card(
                    elevation: 1,
                    color: Colors.black.withOpacity(0.08),
                    child: ElevatedButton(
                      onPressed: () {
                        // send();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactForm()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(05),
                        ),
                        primary: Colors.black.withOpacity(0.08),
                        elevation: 0,
                      ),
                      child: Text(
                        "Contact me",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
