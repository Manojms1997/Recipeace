import 'package:flutter/material.dart';

class AddRecipePage extends StatefulWidget {
  static const addRecipePageRoute = "/add-recipe";

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  bool isVegan = false;
  bool isVegetarian = false;
  Map<String, String> nutrients = {};
  List<String> categories = [];
  List<String> tags = [];
  final nutrientTitleController = TextEditingController();
  final nutrientValueController = TextEditingController();
  final categoryController = TextEditingController();
  final tagController = TextEditingController();
  final raingController = TextEditingController();

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
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: raingController,
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
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
