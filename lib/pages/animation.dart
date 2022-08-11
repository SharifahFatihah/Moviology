import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math' as math;

class Animate extends StatefulWidget {
  const Animate({Key? key}) : super(key: key);

  @override
  State<Animate> createState() => _AnimateState();
}

class _AnimateState extends State<Animate> with TickerProviderStateMixin {
  bool selected = false;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _slideAnimation = Tween<Offset>(
      begin: Offset(0.3, 0.0),
      end: Offset(0.35, 0.0),
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));

    _animationController.addListener(() => setState(() {}));
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 300,
        child: SlideTransition(
          position: _slideAnimation,
          child: const Image(image: AssetImage('images/movie.png')),
        ));
  }
}
