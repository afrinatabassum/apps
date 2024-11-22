MemoryRepository() {
  _recipeStream = _recipeStreamController.stream.asBroadcastStream(
    onListen: (subscription) {
      _recipeStreamController.sink.add(state.currentRecipes);
    },
  );

  _ingredientStream = _ingredientStreamController.stream.asBroadcastStream(
    onListen: (subscription) {
      _ingredientStreamController.sink.add(state.currentIngredients);
    },
  );
}