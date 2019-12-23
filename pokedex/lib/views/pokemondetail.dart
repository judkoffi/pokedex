import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;
  static final String baseUrl = 'http://vps743774.ovh.net:8080/icons';

  const PokemonDetail({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pictureFrame = new Stack(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          child: Image.network(
            pokemon.sprites["large"],
            fit: BoxFit.cover,
          ),
        ),
        new Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: new EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            color: Color.fromRGBO(58, 66, 86, 0.4),
          ),
        ),
        new Positioned(
          left: 8.0,
          top: 60.0,
          child: new InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: new Icon(Icons.arrow_back, color: Colors.grey),
          ),
        )
      ],
    );

    final pictureAnimatedFrame = new Stack(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(left: 15.0),
          height: MediaQuery.of(context).size.height * 0.3,
          child: Image.network(
            pokemon.sprites["animated"],
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
    /*
    final middleFrame = new Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      padding: new EdgeInsets.all(20.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Text(
              pokemon.name,
              style: new TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );*/

    final middleFrame = new Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      padding: new EdgeInsets.all(20.0),
      child: new Row(
        children: <Widget>[
          new Text(
            pokemon.name,
            style: new TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          new VerticalDivider(
            color: Colors.green,
            width: 20,
          ),
          new Row(
            children: pokemon.types
                .map(
                  (type) => new DecoratedBox(
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Image.network(
                      baseUrl +
                          '/' +
                          (type.toString().split('.')[1]).toLowerCase() +
                          '.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );

    return new SafeArea(
      child: new Scaffold(
        body: new Column(
          children: <Widget>[
            pictureFrame,
            middleFrame,
            pictureAnimatedFrame,
          ],
        ),
      ),
    );
  }
}
