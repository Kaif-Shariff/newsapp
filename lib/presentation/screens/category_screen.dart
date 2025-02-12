import 'package:flutter/material.dart';

import '../widgets/home/news_list.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;

  const CategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: CustomScrollView(
        slivers: [
          NewsList(),
        ],
      ),
    );
  }
}
