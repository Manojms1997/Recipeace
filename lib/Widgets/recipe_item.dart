import 'package:flutter/material.dart';
import '../Pages/recipe_details_page.dart';
import '../Models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final double rating;
  final String duration;
  final String description;
  final List<String> ingredients;
  final Map<String, String> nutrients;
  final Map<String, double> steps;

  RecipeItem({this.id,
  this.imageUrl,
  this.rating,
  this.title,
  this.duration,
  this.description,
  this.ingredients,
  this.nutrients,
  this.steps});

  void showRecipeDetails(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(RecipeDetailsPage.recipeDetailsScreenRoute, arguments: {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'duration': duration,
      'rating': rating.toString(),
      'description': description,
      'ingredients': ingredients,
      'nutrients': nutrients,
      'steps': steps
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        onTap: () => showRecipeDetails(context),
        leading: CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(title),
        subtitle: Text(rating.toString()),
      ),
    );
  }
}
