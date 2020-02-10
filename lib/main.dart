import 'package:flutter/material.dart';
import 'converter.dart';

void main() => runApp(ConvertBin());

class ConvertBin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter Binário',
      home: Home(titulo: 'Converter Binário'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  Home({Key k, this.titulo}) : super(key: k);

  final String titulo;

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: Colors.deepPurple, accentColor: Colors.transparent),
      child: MainLayout(),
    );
  }
}

class MainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Converter Binário",
          style: TextStyle(color: Colors.black, fontFamily: "Raleway"),
        ),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: ConverterLayout(),
      ),
    );
  }
}
