import 'package:flutter/material.dart';
import 'var.dart';
import 'snackitem.dart';
import 'fooditem.dart';

void main() async {
  runApp(const FoodSnackApp());
}

class FoodSnackApp extends StatelessWidget {
  const FoodSnackApp({super.key});

  get value => null;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodSnackPage(),
    );
  }

  void increment() {}
}

class FoodSnackPage extends StatelessWidget {
  const FoodSnackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แนะนำอาหารและของว่าง'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // Food section
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'อาหาร',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8.0),
              children: foodItems.map((item) {
                return FoodItem(
                    imageUrl: item["imageUrl"] ?? '',
                    link_url: item["link_url"] ?? '',
                    title: item["title"] ?? '',
                    description: item['description'] ?? "");
              }).toList(),
            ),
          ),
          // Snack section
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'ของว่าง',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(10.0),
              children: snackItems.map((item) {
                return SnackItem(
                    imageUrl: item["imageUrl"] ?? '',
                    link_url: item["link_url"] ?? '',
                    title: item["title"] ?? '',
                    description: item['description'] ?? '');
              }).toList(),
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'อาหาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.no_drinks_sharp),
            label: 'ของว่าง',
          ),
        ],
      ),
    );
  }
}
