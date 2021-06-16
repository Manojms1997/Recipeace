import 'package:flutter/material.dart';
import './Pages/first_page.dart';
import './Pages/recipe_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
      routes: {
        RecipeDetailsPage.recipeDetailsScreenRoute: (ctx) => RecipeDetailsPage()
      },
    );
  }
}

