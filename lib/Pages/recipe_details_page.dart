import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatelessWidget {
  static const recipeDetailsScreenRoute = "/recipe-details";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final imageUrl = routeArgs['imageUrl'];
    final rating = routeArgs['rating'];
    final duration = routeArgs['duration'];
    final description = routeArgs['description'];
    final ingredients = routeArgs['ingredients'];
    final nutrients = routeArgs['nutrients'];
    final steps = routeArgs['steps'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          imageUrl,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 5,
                        child: Container(
                          width: 300,
                          color: Colors.black54,
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule),
                            SizedBox(
                              width: 6,
                            ),
                            Text(duration),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.star),
                            SizedBox(
                              width: 6,
                            ),
                            Text(rating),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Card(
              elevation: 4,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      'Description:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      description,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
