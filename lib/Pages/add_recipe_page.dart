import 'package:flutter/material.dart';

class AddRecipePage extends StatefulWidget {
  static const addRecipePageRoute = "/add-recipe";

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("This is ad recipe page"),
    );
  }
}
