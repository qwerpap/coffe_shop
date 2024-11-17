import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int selectedIndex = 0;

  // Список категорий
  final List<String> categories = [
    'Кофе с молоком',
    'Черный кофе',
    'Чай',
    'Авторские напитки'
  ];

  //КАТЕГОРИИ

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: selectedIndex == index ? Colors.blue : Colors.white,
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                      fontSize: 15,
                      color:
                          selectedIndex == index ? Colors.white : Colors.black),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
