@override
void initState() {
  super.initState();
  final repository = ref.read(repositoryProvider.notifier);

  ingredientStream.listen(
        (ingredients) {
      setState(() {
        currentIngredients = ingredients;
      });
    },
  );
}