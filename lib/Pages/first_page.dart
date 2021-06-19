import 'package:flutter/material.dart';
import 'package:recipes/Pages/add_recipe_page.dart';
import '../Models/recipe.dart';
import '../Widgets/recipe_list.dart';
import '../Data/sample_data.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // List<Recipe> allRecipes = sample_recipes;
  final List<Recipe> _allRecipes = [];
  // final List<Recipe> _allRecipes = sample_recipes;

  _addRecipe(Recipe recipe) {
    print("_addRecipe");
    print(recipe.imageUrl);
    final newRecipe = recipe;
    setState(() {
      _allRecipes.add(newRecipe);
    });
    print(_allRecipes.length);
  }

  void addRecipe(BuildContext ctx) {
    // Navigator.of(ctx).pushNamed(AddRecipePage.addRecipePageRoute,arguments: {'addRecipe': _addRecipe});
    Navigator.of(ctx)
        .push(MaterialPageRoute(builder: (ctx) => AddRecipePage(_addRecipe)));
  }

  void initState()
  {
    super.initState();
    print("init state");
    for (var recipe in sample_recipes) {
        _allRecipes.add(recipe);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
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
              recipes: _allRecipes,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          addRecipe(context);
        },
        label: const Text('Add recipe'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
