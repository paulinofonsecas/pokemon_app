import 'dart:convert';

class PokemonOld {
  int id;
  String name;
  int order;
  int height;
  int weight;
  
  PokemonOld({
    this.id,
    this.name,
    this.order,
    this.height,
    this.weight,
  });

  PokemonOld copyWith({
    int id,
    String name,
    int order,
    int height,
    int weight,
  }) {
    return PokemonOld(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'order': order,
      'height': height,
      'weight': weight,
    };
  }

  factory PokemonOld.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PokemonOld(
      id: map['id'],
      name: map['name'],
      order: map['order'],
      height: map['height'],
      weight: map['weight'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonOld.fromJson(String source) =>
      PokemonOld.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pokemon(id: $id, name: $name, order: $order, height: $height, weight: $weight)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PokemonOld &&
        o.id == id &&
        o.name == name &&
        o.order == order &&
        o.height == height &&
        o.weight == weight;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        order.hashCode ^
        height.hashCode ^
        weight.hashCode;
  }
}
