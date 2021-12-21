import 'package:flutter/material.dart';
import 'package:food/Widgets/recipe_card.dart';
import 'package:food/models/recipe_api.dart';

import 'models/recipe.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.restaurant_menu),
        title: Center(
          child: Text("Food Recipe",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
      ),
    body:_isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
    itemCount: _recipes.length,
    itemBuilder: (context, index) {
    return RecipeCard(
    title: _recipes[index].name,
    cookTime: _recipes[index].totalTime,
    rating: _recipes[index].rating.toString(),
    ThumbnailUrl: _recipes[index].images);

    },
    ));
  }
}
