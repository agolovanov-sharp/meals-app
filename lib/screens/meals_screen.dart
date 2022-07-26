import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/dummy_data.dart';

class MealsScreen extends StatelessWidget {
  static const routeName = '/meals-screen';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final meal = categoryMeals[index];
          return MealItem(
            meal: meal,
            key: ValueKey(meal.id),
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
