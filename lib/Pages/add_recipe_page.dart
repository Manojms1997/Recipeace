import 'package:flutter/material.dart';
import '../Models/recipe.dart';

class AddRecipePage extends StatefulWidget {
  static const addRecipePageRoute = "/add-recipe";

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  String id;
  String title;
  double rating;
  String duration = '';
  String imageUrl = '';
  String description = '';
  String instruction = '';
  bool isVegan = false;
  bool isVegetarian = false;
  Map<String, String> nutrients = {};
  List<String> categories = [];
  List<String> tags = [];
  List<String> ingredients = [];
  Map<String, double> steps = {};
  final titleController = TextEditingController();
  final imageURLController = TextEditingController();
  final descriptionController = TextEditingController();
  final nutrientTitleController = TextEditingController();
  final nutrientValueController = TextEditingController();
  final categoryController = TextEditingController();
  final tagController = TextEditingController();
  final raingController = TextEditingController();
  final durationController = TextEditingController();
  final ingredientController = TextEditingController();
  final stepTitleController = TextEditingController();
  final stepDurationController = TextEditingController();
  final instructionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  submitRecipe(BuildContext ctx) {
    if (_formKey.currentState.validate()) {
      title = titleController.text;
      id = title;
      imageUrl = imageURLController.text;
      description = descriptionController.text;
      rating = double.parse(raingController.text);
      duration = durationController.text;
      instruction = instructionController.text;
      print("instruction: "+instruction+" is of the type:"+ instruction.runtimeType.toString());
      print("title: "+title+" is of the type:"+ title.runtimeType.toString());
      print("imageUrl: "+imageUrl+" is of the type:"+ imageUrl.runtimeType.toString());
      print("description: "+description+" is of the type:"+ description.runtimeType.toString());
      print("rating: "+rating.toString()+" is of the type:"+ rating.runtimeType.toString());
      print("duration: "+duration+" is of the type:"+ duration.runtimeType.toString());
      print("isVegan: "+isVegan.toString()+" is of the type:"+ isVegan.runtimeType.toString());
      print("isVegetarian: "+isVegetarian.toString()+" is of the type:"+ isVegetarian.runtimeType.toString());
      print("nutrients: "+nutrients.toString()+" is of the type:"+ nutrients.runtimeType.toString());
      print("tags: "+tags.toString()+" is of the type:"+ tags.runtimeType.toString());
      print("ingredients: "+ingredients.toString()+" is of the type:"+ ingredients.runtimeType.toString());
      print("steps: "+steps.toString()+" is of the type:"+ steps.runtimeType.toString());

      Recipe new_recipe = Recipe(
        id: id,
        title: title,
        categories: categories,
        description: description,
        duration: duration,
        imageUrl: imageUrl,
        ingredients: ingredients,
        instruction: instruction,
        isVegan: isVegan,
        isVegetarian: isVegetarian,
        nutrients: nutrients,
        rating: rating,
        steps: steps,
        tags: tags
      );

      print(new_recipe.categories);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Recipe'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Text(
                        'Basic Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: titleController,
                        // autovalidateMode: AutovalidateMode.always,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Title cannot be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Title',
                            hintText: 'Enter the name of recipe:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        controller: imageURLController,
                        // autovalidateMode: AutovalidateMode.always,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Image URL cannot be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Image URL',
                            hintText: 'Enter the URL of image for your recipe:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        // autovalidateMode: AutovalidateMode.always,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Description URL cannot be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Description',
                            hintText: 'Describe your recipe:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Colors.black38,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        'Food type',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Vegan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepPurple,
                            ),
                          ),
                          Checkbox(
                            value: isVegan,
                            onChanged: (bool value) {
                              setState(() {
                                isVegan = value;
                              });
                            },
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Vegetarian',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepPurple,
                            ),
                          ),
                          Checkbox(
                            value: isVegetarian,
                            onChanged: (bool value) {
                              setState(() {
                                isVegetarian = value;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Colors.black38,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nutrients Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Nutrient Type cannot be empty';
                        //   }
                        //   return null;
                        // },
                        // autovalidateMode: AutovalidateMode.always,
                        controller: nutrientTitleController,
                        decoration: InputDecoration(
                            labelText: 'Nutrient Type',
                            hintText: 'Ex: Protein, Carbohydrates',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Nutrient Value cannot be empty';
                        //   }
                        //   return null;
                        // },
                        controller: nutrientValueController,
                        // autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                            labelText: 'Nutreint value',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          var enteredNutrientType =
                              nutrientTitleController.text;
                          var enteredNutrientValue =
                              nutrientValueController.text;
                          setState(() {
                            nutrients[enteredNutrientType] =
                                enteredNutrientValue;
                          });
                          print(nutrients);
                          nutrientTitleController.clear();
                          nutrientValueController.clear();
                        },
                        child: Text('Add'),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nutrients added:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      for (var nutrient in nutrients.keys)
                        Text(nutrient + ": " + nutrients[nutrient])
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Colors.black38,
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: categoryController,
                        // autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                            labelText: 'Add category',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          var enteredCategory = categoryController.text;
                          setState(() {
                            categories.add(enteredCategory);
                          });
                          print(categories);
                          categoryController.clear();
                        },
                        child: Text('Add'),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Categories added:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      for (var category in categories) Text(category)
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Colors.black38,
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Tags',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: tagController,
                        // autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                            labelText: 'Add Tag',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          var enteredTag = tagController.text;
                          setState(() {
                            tags.add(enteredTag);
                          });
                          print(tags);
                          tagController.clear();
                        },
                        child: Text('Add'),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'tags added:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      for (var tag in tags) Text(tag)
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Colors.black38,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Rating',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: raingController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Rating cannot be empty';
                          }
                          if (double.parse(value) > 5 ||
                              double.parse(value) < 1) {
                            return 'Invalid rating value';
                          }
                          return null;
                        },
                        // autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                            labelText: 'Add Rating',
                            hintText: 'Enter rating between 1 and 5',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Colors.black38,
                ),
                // To do: Add duration, ingredients, steps, instructions options
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Duration',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: durationController,
                        // autovalidateMode: AutovalidateMode.always,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Duration cannot be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Add Duration',
                            hintText:
                                'Enter the total time taken to prepare your recipe',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Colors.black38,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Ingredients',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: ingredientController,
                        // autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                            labelText: 'Add Ingredient',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          var enteredIngredient = ingredientController.text;
                          setState(() {
                            ingredients.add(enteredIngredient);
                          });
                          print(tags);
                          ingredientController.clear();
                        },
                        child: Text('Add'),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingredients added:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      for (var ingredient in ingredients) Text(ingredient)
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Colors.black38,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Steps:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: stepTitleController,
                        // autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                            labelText: 'Describe Step',
                            hintText: 'Describe step with ingredient quantity',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: stepDurationController,
                        // autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                            labelText: 'Add Duration',
                            hintText:
                                'Duration required in mins. Enter 1 if no time required',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          var enteredStepTitle = stepTitleController.text;
                          var enteredStepDuration =
                              double.parse(stepDurationController.text);
                          setState(() {
                            steps[enteredStepTitle] = enteredStepDuration;
                          });
                          print(tags);
                          stepTitleController.clear();
                          stepDurationController.clear();
                        },
                        child: Text('Add'),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Steps added:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      for (var step in steps.keys)
                        Text(
                          step + ": " + steps[step].toString(),
                        )
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Colors.black38,
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Instructions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Instruction cannot be empty';
                          }
                          return null;
                        },
                        controller: instructionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                            labelText: 'Instructions',
                            hintText:
                                'Add any additional instructions for recipe:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          submitRecipe(context);
        },
        label: const Text('SUBMIT'),
        icon: const Icon(Icons.check),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
