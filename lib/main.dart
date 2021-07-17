import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:xxx_animation/slider.dart';
import 'package:xxx_animation/slidingAppBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<Container> containers = [
    Container(
      height: 120,
      margin: EdgeInsets.only(left: 0, right: 0),
      color: Colors.yellow,
    ),
    Container(
      height: 120,
      margin: EdgeInsets.only(left: 0, right: 0),
      color: Colors.red,
    ),
    Container(
      height: 120,
      margin: EdgeInsets.only(left: 0, right: 0),
      color: Colors.green,
    ),
    Container(
      height: 120,
      margin: EdgeInsets.only(left: 0, right: 0),
      color: Colors.pink,
    ),
    Container(
      margin: EdgeInsets.only(left: 0, right: 0),
      height: 120,
      color: Colors.cyan,
    ),
    Container(
      height: 120,
      margin: EdgeInsets.only(left: 0, right: 0),
      color: Colors.orange,
    ),
    Container(
      height: 120,
      margin: EdgeInsets.only(left: 0, right: 0),
      color: Colors.blue,
    ),
    Container(
      height: 120,
      margin: EdgeInsets.only(left: 0, right: 0),
      color: Colors.grey,
    ),
    Container(
      height: 120,
      margin: EdgeInsets.only(left: 0, right: 0),
      color: Colors.cyan,
    ),
    Container(
      height: 120,
      margin: EdgeInsets.only(left: 0, right: 0),
      color: Colors.orange,
    ),
    Container(
      height: 120,
      margin: EdgeInsets.only(left: 0, right: 0),
      color: Colors.blue,
    ),
    Container(
      height: 120,
      margin: EdgeInsets.only(left: 0, right: 0),
      color: Colors.grey,
    ),
  ];

  bool isVisible = false;
  ScrollController _sc = ScrollController();
  double _currentSliderValue = 0.4;
  bool _visible = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _sc.addListener(() {
      if (_sc.position.outOfRange && !isVisible) {}
    });
  }

  void close() {
    setState(() => _visible = false);
    if (containers.length == 13) {
      containers.removeAt(0);
    }
  }

  void showAppBar() {
    setState(() => _visible = true);
  }

  void open() {
    setState(() => _visible = false);

    // containers.insert(
    //   0,
    //   Container(
    //     height: 120,
    //     margin: EdgeInsets.only(left: 0, right: 0),
    //     color: Colors.grey,
    //   ),
    // );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SlidingAppBar(
          child: AppBar(
            title: Text('Search'),
            toolbarHeight: _visible ? 80 : 0,
          ),
          controller: _controller,
          visible: _visible),
      body: SlidingUpPanel(
        maxHeight: MediaQuery.of(context).size.height,
        minHeight: MediaQuery.of(context).size.height * 0.4,
        body: _body(),
        panelBuilder: (sc) => _panel(sc),
        onPanelOpened: open,
        onPanelClosed: close,
        onPanelSnapPoint: showAppBar,
        snapPoint: 0.8,
        onPanelSlide: (double value) => setState(() {
          setState(() {
            _currentSliderValue = value;
            // if (value > 0.79 && value < 0.82) {
            //   print("show app bar");
            // }
            print(_currentSliderValue);
          });
        }),
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    _sc = sc;
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Stack(children: [
          listCustom(sc),
          GestureDetector(
            onTap: () => setState(() {
              isVisible = !isVisible;
              sc.animateTo(1200,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            }),
            child: Container(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    curve: Curves.linear,
                    bottom: 600 - (_currentSliderValue * 500),
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
                    bottom: 600 - (_currentSliderValue * 500),
                    left:
                        isVisible ? 20 : MediaQuery.of(context).size.width - 80,
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
                    bottom: 600 - (_currentSliderValue * 500),
                    left:
                        isVisible ? 20 : MediaQuery.of(context).size.width - 80,
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
                    bottom: 600 - (_currentSliderValue * 500),
                    right: 20,
                    height: isVisible ? 157 : 60,
                    width: isVisible ? 157 : 60,
                    duration: Duration(milliseconds: 300),
                    child: AnimatedOpacity(
                      opacity: isVisible ? 0 : 1,
                      duration: Duration(milliseconds: 300),
                      child: Container(
                        color: Colors.black,
                        child: Text("4"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height *
                  ((_currentSliderValue - 0.4) * 0.4)),
          width: MediaQuery.of(context).size.width -
              (MediaQuery.of(context).size.width *
                  ((_currentSliderValue - 0.4) * 0.4)),
          decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ],
    );
  }

  CustomScrollView listCustom(ScrollController sc) {
    return CustomScrollView(controller: sc, slivers: [
      SliverList(
        delegate: SliverChildListDelegate(
          [
            Column(
              children: containers,
            ),
            VisibilityDetector(
              key: Key('my-widget-key'),
              onVisibilityChanged: (visibilityInfo) {
                var visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage == 100 && !isVisible) {
                  setState(() {
                    isVisible = true;
                  });
                  sc.animateTo(sc.position.maxScrollExtent,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
                }
              },
              child: Container(
                height: 120,
                width: 50,
                color: Colors.red,
              ),
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
                  crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 120,
                    width: 50,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 120,
                    width: 50,
                    color: Colors.red,
                  ),
                  Container(
                    height: 120,
                    width: 50,
                    color: Colors.green,
                  ),
                  Container(
                    height: 120,
                    width: 50,
                    color: Colors.orange,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
