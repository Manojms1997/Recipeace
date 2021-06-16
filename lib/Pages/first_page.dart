import 'package:flutter/material.dart';
import '../Models/recipe.dart';
import '../Widgets/recipe_list.dart';
import '../Data/sample_data.dart';

class FirstPage extends StatelessWidget {
  final List<Recipe> allRecipes = sample_recipes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipeace'),
      ),
      body: Column(
        children: [
          //recipe image viewer
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                sample_recipes[0]
                    .imageUrl, // currently only showing first recipe image
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //category and recipes
          Flexible(
            fit: FlexFit.tight,
            child: RecipeList(
              recipes: allRecipes,
            ),
          ),
        ],
      ),
    );
  }
}
