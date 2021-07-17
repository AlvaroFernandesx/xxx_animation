import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp((MyApp()));

class SlidingAppBar extends PreferredSize {
  SlidingAppBar({
    required this.child,
    required this.controller,
    required this.visible,
  }) : super(
            preferredSize: Size(0, 0),
            child: Container(
              width: 100,
              color: Colors.pink,
              height: 200,
            ));

  @override
  final PreferredSizeWidget child;

  @override
  Size get preferredSize => child.preferredSize;

  final AnimationController controller;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    visible ? controller.reverse() : controller.forward();
    return SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: Offset(0, -1)).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
      ),
      child: child,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  bool _visible = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: !_visible, // Uses entire screen after hiding AppBar
      floatingActionButton: FloatingActionButton.extended(
        label: Text(_visible ? 'Hide' : 'Show'),
        onPressed: () => setState(() => _visible = !_visible),
      ),
      appBar: SlidingAppBar(
        controller: _controller,
        visible: _visible,
        child: AppBar(title: Text('AppBar')),
      ),
    );
  }
}
