import 'dart:convert';
import 'api.dart';
import 'sobre.dart';
import 'buscar.dart';
import 'package:flutter/material.dart';
import 'bebidas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Http-Json-ListView',
      home: BuildListView(),
    );
  }
}
class BuildListView extends StatefulWidget {
  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  var bebidas = new List<Post>();

  _getUsers(){
    API.getUsers().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        bebidas = lista.map((model) => Post.fromJson(model)).toList();
      });
    });
  }

  _BuildListViewState() {
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {

    if(MediaQuery.of(context).orientation == Orientation.portrait)
    {
      return portrait();
    }
    else {
      return landscape();
    }
  }


  Widget portrait() {

    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepPurple,
      title: const Text('Bebidas'),
      actions: <Widget>[
        // action button
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context,
                  delegate: CustomSearchDelegate(bebidas));
            }
           // hintText: 'Search ...'
        ),
      ],
    ),

        body: listaUsuarios()
    );
  }
  Widget landscape() {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Bebidas'),
          actions: <Widget>[
            // action button
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context,
                      delegate: CustomSearchDelegate(bebidas));
                }
              // hintText: 'Search ...'
            ),
          ],
        ),

        body: listaUsuarios2()
    );
  }
listaUsuarios() {

  return ListView.builder(
    itemCount : bebidas.length,
    itemBuilder: (context, index)
    {

      return ListTile(

        leading: Image.network(bebidas[index].image),
        title: Align(
          alignment: Alignment.topLeft,
          child:Text(bebidas[index].name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black))),
        subtitle: Text(bebidas[index].firstbrewed,style: TextStyle(
            fontSize: 11.0,
            color: Colors.deepPurple)),


        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(detalhe: bebidas[index]),
            ),
          );
        },
      );
    },
  );
}

  listaUsuarios2() {
    return ListView.builder(
      itemCount : bebidas.length,
      itemBuilder: (context, index)
      {

        return ListTile(

          leading: Image.network(bebidas[index].image),
          title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(bebidas[index].name ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                    color: Colors.black)),
                Text(bebidas[index].firstbrewed,style: TextStyle(
                    fontSize: 9.0,
                    color: Colors.deepPurple)),
                Text(bebidas[index].description,style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.black)),
              ]),

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(detalhe: bebidas[index]),
              ),
            );
          },
        );
      },
    );
  }
}