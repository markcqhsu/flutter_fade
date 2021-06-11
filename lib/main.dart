import 'package:flutter/material.dart';

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
  static const url1 =
      "https://exp.gg/wp-content/uploads/2019/05/apps.608.13510798887677013.5c7792f0-b887-4250-8c4e-4617af9c4509.jpeg";
  static const url2 =
      "https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/news/minecraft-with-rtx/minecraft-with-rtx-beta-of-temples-and-totems-creator-world-key-art.jpg";
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FCD 02"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() => _showFirst = !_showFirst);
          },
          child: AnimatedCrossFade(
            firstChild: Image.network(url1),
            secondChild: Image.network(url2),
            // firstCurve: LinearHalfCurve(), //f(t) = 2t
            // secondCurve: LinearHalfCurve().flipped,
            // firstCurve: Curves.easeOutExpo,
            // secondCurve: Curves.easeInBack,
            firstCurve: Interval(0.0, 0.5),
            secondCurve: Interval(0.5, 1.0),
            duration: Duration(seconds: 2),
            crossFadeState: _showFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }
}

class LinearHalfCurve extends Curve {
  @override
  double transformInternal(double t) {
    if (t < 0.5) {
      return t * 2; //double speed during]0, 0.5]
    }
    return 1.0; //constant 1.0 during [0.5, 1.0]
  }
}
