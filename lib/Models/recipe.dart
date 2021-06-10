import 'package:flutter/foundation.dart';

class Recipe {
  final String id;
  final String title;
  final List<String> tags;
  final double rating;
  final List<String> categories;
  final String duration;
  final bool isVegan;
  final bool isVegetarian;
  final Map<String, String> nutrients;
  final List<String> ingredients;
  final Map<String, double> steps;
  final String imageUrl;
  final String description;
  final String instruction;

  const Recipe(
      {@required this.id,
      @required this.title,
      @required this.tags,
      @required this.rating,
      @required this.categories,
      @required this.duration,
      @required this.isVegan,
      @required this.isVegetarian,
      @required this.nutrients,
      @required this.ingredients,
      @required this.steps,
      @required this.imageUrl,
      @required this.description,
      @required this.instruction});
}
