late Stream<List<Recipe>> _recipeStream;
late Stream<List<Ingredient>> _ingredientStream;

final StreamController<List<Recipe>> _recipeStreamController = StreamController<List<Recipe>>();
final StreamController<List<Ingredient>> _ingredientStreamController = StreamController<List<Ingredient>>();