@override
Future<int> insertRecipe(Recipe recipe) async {
  if (state.currentRecipes.contains(recipe)) {
    return Future.value(0);
  }

  state = state.copyWith(currentRecipes: [...state.currentRecipes, recipe]);

  // Add updated list of recipes to the stream
  _recipeStreamController.sink.add(state.currentRecipes);

  final ingredients = <Ingredient>[];
  for (final ingredient in recipe.ingredients) {
    ingredients.add(ingredient.copyWith(recipeId: recipe.id));
  }

  // Insert ingredients into the repository (not shown here)
  insertIngredients(ingredients);

  return Future.value(0);
}
