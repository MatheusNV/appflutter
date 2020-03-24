import 'sobre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bebidas.dart';


class CustomSearchDelegate extends SearchDelegate<String> {
  static const IconData backspace = IconData(0xe14a, fontFamily: 'MaterialIcons', matchTextDirection: true);
  String get searchFieldLabel => "Pesquisar bebidas";
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);

    return theme.copyWith(
      primaryColor: Colors.deepPurple,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
        textTheme : theme.textTheme. copyWith (
            title : theme.textTheme.title
                . copyWith (color : Colors.white)));


  }

  final List<Post> bebida;

  CustomSearchDelegate(this.bebida);

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    return [IconButton(icon: Icon(Icons.backspace), onPressed: () {
      query = '';
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    final suggestionList = bebida;

    return ListView.builder(itemBuilder: (context, index) => ListTile(isThreeLine: true,

      title: Text(bebida[index].name),


    ),
      itemCount: suggestionList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something

    final suggestionList = query.isEmpty
        ? bebida
        : bebida.where((p) => p.name.contains(RegExp(query, caseSensitive: false))).toList();


    return ListView.builder(itemBuilder: (context, index) => ListTile(

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(detalhe: suggestionList[index]),
          ),
        );
      },

      leading: Image.network(bebida[index].image),
      title: RichText(
        text: TextSpan(
            text: suggestionList[index].name.substring(0, query.length),
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: suggestionList[index].name.substring(query.length),
                  style: TextStyle(color: Colors.grey)),
            ]),
      ),
    ),
      itemCount: suggestionList.length,
    );
  }
}