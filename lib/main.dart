import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key key}) : super(key: key);

  final double offsetValue = 5;
  final double blurRadius = 5;

  final Color primaryColor = Color.fromARGB(255, 235, 235, 235);
  final Color secondaryColor = Color.fromARGB(255, 220, 220, 220);
  final Color thirdthColor = Color.fromARGB(255, 200, 210, 220);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              thirdthColor: thirdthColor,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final Color thirdthColor;

  CustomButton({
    Key key,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.thirdthColor,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final double offsetValue = 5;

  double size = 300;
  double radius = 50;
  final Duration duration = Duration(milliseconds: 50);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          size = 280;
          radius = 70;
        });
      },
      onTapUp: (details) {
        print(details);
        setState(() {
          size = 300;
          radius = 50;
        });
      },
      child: AnimatedContainer(
        child: TweenAnimationBuilder<double>(
          builder: (context, value, child) {
            return Icon(
              Icons.play_arrow_rounded,
              size: value * .7,
              color: widget.secondaryColor,
            );
          },
          tween: Tween(begin: size, end: size),
          duration: duration,
        ),
        duration: duration,
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: widget.primaryColor,
          boxShadow: [
            BoxShadow(
              color: widget.secondaryColor,
              offset: Offset(-offsetValue, -offsetValue),
              blurRadius: 10,
            ),
            BoxShadow(
              color: widget.thirdthColor,
              offset: Offset(offsetValue, offsetValue),
              blurRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
