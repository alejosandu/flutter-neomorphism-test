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

  final Color backgroundColor = Color.fromARGB(255, 220, 220, 220);
  final Color primaryColor = Color.fromARGB(255, 235, 235, 235);
  final Color secondaryColor = Color.fromARGB(255, 240, 240, 240);
  final Color thirdthColor = Color.fromARGB(255, 200, 210, 220);
  final Color iconColor = Color.fromARGB(255, 220, 220, 220);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              thirdthColor: thirdthColor,
              iconColor: iconColor,
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
  final Color iconColor;

  CustomButton({
    Key key,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.thirdthColor,
    @required this.iconColor,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final double offsetValue = 5;

  double size = 300;
  double radius = 50;
  double bevel = 10;
  double gradientPressed = 0;
  double offset = 10;
  final Duration duration = Duration(milliseconds: 40);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        setState(() {
          size = 290;
          radius = 70;
          gradientPressed = .2;
          bevel = 0;
          offset = 0;
        });
      },
      onPointerUp: (_) {
        setState(() {
          size = 300;
          radius = 50;
          gradientPressed = 0;
          bevel = 10;
          offset = 10;
        });
      },
      child: AnimatedContainer(
        child: TweenAnimationBuilder<double>(
          builder: (context, value, child) {
            return Icon(
              Icons.play_arrow_rounded,
              size: value * .7,
              color: widget.iconColor,
            );
          },
          tween: Tween(begin: size, end: size),
          duration: duration,
        ),
        duration: duration,
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: widget.primaryColor,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.lerp(
                widget.primaryColor,
                widget.thirdthColor,
                gradientPressed * 2,
              ),
              widget.primaryColor,
              Color.lerp(
                widget.primaryColor,
                Colors.white,
                gradientPressed * 8,
              ),
            ],
            stops: [.15, .5, .7],
          ),
          boxShadow: [
            BoxShadow(
              color: widget.secondaryColor,
              offset: -Offset(offset, offset),
              blurRadius: bevel,
            ),
            BoxShadow(
              color: widget.thirdthColor,
              offset: Offset(offset, offset),
              blurRadius: bevel,
            ),
          ],
        ),
      ),
    );
  }
}
