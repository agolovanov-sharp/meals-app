import 'package:flutter/material.dart';
import 'package:meals_app/models/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal-detail';

  MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (element) => element.id == mealId,
    );

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Ingridients',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Container(
                width: 300,
                height: 150,
                child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Text(selectedMeal.ingredients[index])),
                    );
                  },
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Container(
                width: 300,
                height: 150,
                child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(child: Text('# ${index + 1}')),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider()
                      ],
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
