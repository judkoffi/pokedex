import 'package:enum_to_string/enum_to_string.dart';
import 'package:pokedex/models/pokemoninfo.dart';
import 'package:pokedex/models/pokemontype.dart';

class Pokemon {
  int id;
  String name;
  String picture;
  String candy;
  String egg;
  double mutlipliers;
  List<PokemonType> weaknesses;
  PokemonInfo pokemonInfos;
  List<PokemonType> types;

  Pokemon(this.id, this.name, this.picture, this.candy, this.egg,
      this.mutlipliers, this.weaknesses, this.pokemonInfos, this.types);

  /*
  "avgSpawns": 69,
"candy": "Bulbasaur Candy",
"egg": "2 km",
"height": "0.71 m",
"id": 1,
"img": "http://www.serebii.net/pokemongo/pokemon/001.png",
"name": "Bulbasaur",
"num": "001",
"spawn": 0.69,
"spawnTime": "20:00",
"type":[
"GRASS",
"POISON"
],
"weakness":["FIRE", "ICE", "FLYING", "PSYCHIC"],
"weight": "6.9 kg"
*/

  Pokemon.fromJson(Map json) {
    this.id = json['id'];
    this.name = json['name'];
    this.candy = json['candy'];
    this.egg = json['egg'];
    this.picture = json['img'];
    this.mutlipliers = json['multipliers'];
    this.pokemonInfos = new PokemonInfo(json['height'], json['weight'], "-1",
        json['avgSpawns'].toString(), json['spawnTime'].toString());
    this.types = List.of(json['type'])
        .map((type) => EnumToString.fromString(PokemonType.values, type))
        .toList();
    this.weaknesses = List.of(json['type'])
        .map((type) => EnumToString.fromString(PokemonType.values, type))
        .toList();
  }

  @override
  bool operator ==(o) => o is Pokemon && name == o.name && id == o.id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
