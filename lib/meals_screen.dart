import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class MealsScreen extends StatelessWidget {
  final Category category;

  const MealsScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('Category contents'),
      ),
    );
  }
}
