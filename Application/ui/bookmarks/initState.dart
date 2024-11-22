@override
void initState() {
  super.initState();
  final repository = ref.read(repositoryProvider.notifier);
  recipeStream = repository.watchAllRecipes();
}