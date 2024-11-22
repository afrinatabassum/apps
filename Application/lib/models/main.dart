import 'package:flutter/material.dart';
import 'models/recipe.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipes = [
    Recipe(
      id: '1',
      name: 'Spaghetti Bolognese',
      ingredients: ['Spaghetti', 'Ground Beef', 'Tomato Sauce', 'Onion'],
      instructions: 'Cook spaghetti. Brown the beef. Mix with sauce.',
    ),
    Recipe(
      id: '2',
      name: 'Chicken Curry',
      ingredients: ['Chicken', 'Curry Powder', 'Coconut Milk', 'Onion'],
      instructions: 'Cook chicken. Add curry and coconut milk.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              // Navigate to Add Recipe Screen
              final newRecipe = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddRecipeScreen()),
              );

              // If a new recipe is added, update the list
              if (newRecipe != null) {
                setState(() {
                  recipes.add(newRecipe);
                });
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipe: recipe),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/*class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _nameController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Recipe Name'),
            ),
            TextField(
              controller: _ingredientsController,
              decoration: InputDecoration(labelText: 'Ingredients (comma separated)'),
            ),
            TextField(
              controller: _instructionsController,
              decoration: InputDecoration(labelText: 'Instructions'),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Create a new recipe
                final newRecipe = Recipe(
                  id: DateTime.now().toString(),
                  name: _nameController.text,
                  ingredients: _ingredientsController.text.split(','),
                  instructions: _instructionsController.text,
                );

                // Navigate back to the recipe list
                Navigator.pop(context, newRecipe);
              },
              child: Text('Add Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}

*/

 */
/*class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatelessWidget {
  // Dummy data
  final List<Recipe> recipes = [
    Recipe(
      id: '1',
      name: 'Spaghetti Bolognese',
      ingredients: ['Spaghetti', 'Ground Beef', 'Tomato Sauce', 'Onion'],
      instructions: 'Cook spaghetti. Brown the beef. Mix with sauce.',
    ),
    Recipe(
      id: '2',
      name: 'Chicken Curry',
      ingredients: ['Chicken', 'Curry Powder', 'Coconut Milk', 'Onion'],
      instructions: 'Cook chicken. Add curry and coconut milk.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe List'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe.name),
            onTap: () {
              // Navigate to recipe details screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipe: recipe),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ...recipe.ingredients.map((ingredient) => Text('• $ingredient')),
            SizedBox(height: 16),
            Text(
              'Instructions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(recipe.instructions),
          ],
        ),
      ),
    );
  }
}*/
