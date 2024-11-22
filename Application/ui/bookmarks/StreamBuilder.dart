return StreamBuilder<List<Recipe>>(
stream: recipeStream,
builder: (context, AsyncSnapshot<List<Recipe>> snapshot) {
if (snapshot.connectionState == ConnectionState.active) {
final recipes = snapshot.data ?? [];
// Build your UI here using the recipes list
return ListView.builder(
itemCount: recipes.length,
itemBuilder: (context, index) {
final recipe = recipes[index];
return ListTile(title: Text(recipe.name));
},
);
} else if (snapshot.connectionState == ConnectionState.waiting) {
return CircularProgressIndicator();
} else {
return Center(child: Text('No recipes available.'));
}
},
);