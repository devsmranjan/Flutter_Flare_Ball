import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

const String appName = "Flare Ball";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Flexible(
          child: _buildFlareActor(),
        ),
        Container(
          padding: EdgeInsets.all(24.0),
          child: _buildBottonRow(),
        )
      ],
    );
  }

  Widget _buildFlareActor() {
    return FlareActor(
      "assets/flare/bouncing_ball.flr",
      alignment: Alignment.center,
      color: Colors.blue,
      fit: BoxFit.cover,
      animation: _animation,
    );
  }

  Widget _buildBottonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildBotton(
            animation: "up", icon: Icons.arrow_upward, color: Colors.green),
        _buildBotton(
            animation: "down", icon: Icons.arrow_downward, color: Colors.green),
        _buildBotton(
            animation: "left", icon: Icons.arrow_back, color: Colors.orange),
        _buildBotton(
            animation: "right",
            icon: Icons.arrow_forward,
            color: Colors.orange),
      ],
    );
  }

  Widget _buildBotton({String animation, IconData icon, Color color}) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _animation = animation.toLowerCase();
        });
      },
      child: Icon(icon),
      backgroundColor: color,
    );
  }
}
