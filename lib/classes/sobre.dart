import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bebidas.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Post detalhe;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.detalhe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    if (MediaQuery
        .of(context)
        .orientation == Orientation.portrait) {
      return portrait();
    }
    else {
      return landscape();
    }
  }


  Widget portrait() {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple,
        title: Text(detalhe.name),
      ),
      body: new Container(
        margin: new EdgeInsets.all(8.0),
        child: new Material(
          elevation: 4.0,
          borderRadius: new BorderRadius.circular(6.0),
          child: new ListView(
            children: <Widget>[
              _getImageNetwork(detalhe.image),
              _getBody(detalhe.name, detalhe.tagline, detalhe.description),
            ],
          ),
        ),
      ),
    );
  }


  Widget landscape() {


    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple,
        title: Text(detalhe.name),
      ),
      body: new GridView.count(childAspectRatio:11/11,

          primary: false,
          padding: const EdgeInsets.all(15),
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          crossAxisCount: 2,

          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(15),
                child: _getImageNetwork(detalhe.image),
            ),
            Container(
               padding: const EdgeInsets.all(11),
                child:  _getBody(detalhe.name, detalhe.tagline, detalhe.description),
            ),
          ],
      ),
    );

  }

  Widget _getImageNetwork(url){

    return new Container(
      height: 300.0,
      child: new Image.network(detalhe.image),
    );

  }

  Widget _getBody(tittle,date,description){

    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          _getTittle(detalhe.name),
          _getDate(detalhe.tagline),
          _getDescription(detalhe.description),
        ],
      ),
    );
  }

  _getTittle(tittle) {
    return new Text(detalhe.name,
      style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0),
    );
  }

  _getDate(date) {

    return new Container(
        margin: new EdgeInsets.only(top: 5.0),
        child: new Text(detalhe.tagline,
          style: new TextStyle(
              fontSize: 10.0,
              color: Colors.deepPurple,
          ),
        )
    );
  }

  _getDescription(description) {
    return new Container(
      margin: new  EdgeInsets.only(top: 10.0),
      child: new Text(detalhe.description, style: new TextStyle(
          fontSize: 12.0),),
    );
  }



}