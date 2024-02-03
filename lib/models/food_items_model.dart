// To parse this JSON data, do
//
//     final foodItems = foodItemsFromJson(jsonString);

import 'dart:convert';

FoodItems foodItemsFromJson(String str) => FoodItems.fromJson(json.decode(str));

String foodItemsToJson(FoodItems data) => json.encode(data.toJson());

class FoodItems {
  List<Item> items;

  FoodItems({
    required this.items,
  });

  factory FoodItems.fromJson(Map<String, dynamic> json) => FoodItems(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  String name;
  String price;
  String recipe;
  String polularity;

  Item({
    required this.name,
    required this.price,
    required this.recipe,
    required this.polularity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"],
    price: json["price"],
    recipe: json["recipe "],
    polularity: json["polularity"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "recipe ": recipe,
    "polularity": polularity,
  };
}
