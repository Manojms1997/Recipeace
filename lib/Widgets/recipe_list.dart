import 'package:flutter/material.dart';
import '../Models/recipe.dart';
import './recipe_item.dart';

class RecipeList extends StatelessWidget {
  final List<Recipe> recipes;

  RecipeList({this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          return RecipeItem(
            id: recipes[index].id,
            title: recipes[index].title,
            imageUrl: recipes[index].imageUrl,
            rating: recipes[index].rating,
            duration: recipes[index].duration,
            description: recipes[index].description,
            ingredients: recipes[index].ingredients,
            nutrients: recipes[index].nutrients,
            steps: recipes[index].steps,
          );
        });
  }
}
