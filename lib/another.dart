import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isVisible = false;
  ScrollController _sc = ScrollController();

  @override
  void initState() {
    super.initState();
    _sc.addListener(() {
      if (_sc.position.outOfRange && !isVisible) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          CustomScrollView(controller: _sc, slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  bodyWidget(Colors.blue),
                  bodyWidget(Colors.red),
                  bodyWidget(Colors.green),
                  bodyWidget(Colors.orange),
                  bodyWidget(Colors.blue),
                  VisibilityDetector(
                    key: Key('my-widget-key'),
                    onVisibilityChanged: (visibilityInfo) {
                      var visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage == 100 && !isVisible) {
                        setState(() {
                          isVisible = true;
                        });
                        _sc.animateTo(_sc.position.maxScrollExtent,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear);
                      }
                    },
                    child: bodyWidget(Colors.red),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 20, right: 20),
              sliver: SliverVisibilityDetector(
                key: Key("chave"),
                onVisibilityChanged: (visibilityInfo) {
                  var visiblePercentage = visibilityInfo.visibleFraction * 100;
                  if (visiblePercentage == 0 && isVisible) {
                    setState(() {
                      isVisible = false;
                    });
                  }
                },
                sliver: Container(
                  child: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20),
                    delegate: SliverChildListDelegate(
                      [
                        bodyWidget(Colors.blue),
                        bodyWidget(Colors.red),
                        bodyWidget(Colors.green),
                        bodyWidget(Colors.orange),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
          AnimatedPositioned(
            curve: Curves.linear,
            bottom: isVisible ? 178 : 200,
            left: isVisible ? 20 : MediaQuery.of(context).size.width - 80,
            right: isVisible ? null : 20,
            height: isVisible ? 157 : 60,
            width: isVisible ? 157 : 60,
            duration: Duration(milliseconds: 300),
            child: AnimatedOpacity(
              opacity: isVisible ? 0 : 1,
              duration: Duration(milliseconds: 300),
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.linear,
            bottom: isVisible ? 178 : 200,
            right: 20,
            height: isVisible ? 157 : 60,
            width: isVisible ? 157 : 60,
            duration: Duration(milliseconds: 300),
            child: AnimatedOpacity(
              opacity: isVisible ? 0 : 1,
              duration: Duration(milliseconds: 300),
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.linear,
            bottom: isVisible ? 0 : 200,
            left: isVisible ? 20 : MediaQuery.of(context).size.width - 80,
            height: isVisible ? 157 : 60,
            width: isVisible ? 157 : 60,
            duration: Duration(milliseconds: 300),
            child: AnimatedOpacity(
              opacity: isVisible ? 0 : 1,
              duration: Duration(milliseconds: 300),
              child: Container(
                color: Colors.green,
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.linear,
            bottom: isVisible ? 0 : 200,
            right: 20,
            height: isVisible ? 157 : 60,
            width: isVisible ? 157 : 60,
            duration: Duration(milliseconds: 300),
            child: AnimatedOpacity(
              opacity: isVisible ? 0 : 1,
              duration: Duration(milliseconds: 300),
              child: Container(
                color: Colors.orange,
                child: Text("4"),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
      ),
    );
  }

  Widget bodyWidget(Color color) {
    return Container(
      height: 120,
      color: color,
    );
  }
}
