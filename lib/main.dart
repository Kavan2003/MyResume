import 'package:portfolio/Home/moblileHome.dart';
import 'package:portfolio/Home/webHome.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Portfolio',
        theme: ThemeData(useMaterial3: true),
        home: Container(
          child: ScreenTypeLayout.builder(
            // breakpoints:
            //     const ScreenBreakpoints(tablet: 600, desktop: 950, watch: 300),
            mobile: (BuildContext context) => PortfolioHome(),
            tablet: (BuildContext context) => PortfolioHome(),
            desktop: (BuildContext context) => PortfolioHome(),
            // watch: ,
          ),
        ));
  }
}
