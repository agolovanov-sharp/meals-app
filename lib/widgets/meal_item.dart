import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({Key? key, required this.meal}) : super(key: key);

  void handleItemTap() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handleItemTap,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Image.network(
                  meal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                meal.title,
                style: const TextStyle(fontSize: 26, color: Colors.white),
                softWrap: true,
                overflow: TextOverflow.fade,
              )
            ],
          )
        ]),
      ),
    );
  }
}
