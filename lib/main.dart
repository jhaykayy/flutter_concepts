/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Products',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Optional: Use colorScheme if needed
      ),
      home: const ProductDisplayScreen(title: 'Product Display'),
    );
  }
}

class ProductDisplayScreen extends StatelessWidget {
  const ProductDisplayScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const <Widget>[
          ProductCard(
            image: AssetImage('assets/images/bag.png'),
            title: 'Product 1',
            description: 'This is a description for Product 1.',
          ),
          SizedBox(height: 20),
          ProductCard(
            image: AssetImage('assets/images/phone.jpg'),
            title: 'Product 2',
            description: 'This is a description for Product 2.',
          ),
          SizedBox(height: 20),
          ProductCard(
            image: AssetImage('assets/images/mobile.png'),
            title: 'Product 3',
            description: 'This is a description for Product 3.',
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final AssetImage image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Image(image: image, 
                height: 150, 
                width: double.infinity, 
                fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
} 
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Products',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductDisplayScreen(title: 'Product Display'),
    );
  }
}

class ProductDisplayScreen extends StatelessWidget {
  ProductDisplayScreen({super.key, required this.title});

  final String title;

  // Sample product data
  final List<Map<String, String>> products = [
    {"image": "assets/images/bag.png", "title": "Product 1", "desc": "This is Product 1"},
    {"image": "assets/images/phone.jpg", "title": "Product 2", "desc": "This is Product 2"},
    {"image": "assets/images/mobile.png", "title": "Product 3", "desc": "This is Product 3"},
    {"image": "assets/images/watch.png", "title": "Product 4", "desc": "This is Product 4"},
    {"image": "assets/images/watch.png", "title": "Product 4", "desc": "This is Product 5"},
    {"image": "assets/images/watch.png", "title": "Product 4", "desc": "This is Product 6"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 10, // Horizontal spacing
            mainAxisSpacing: 10, // Vertical spacing
            childAspectRatio: 0.8, // Adjust height/width ratio
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              image: Image.asset(products[index]["image"]!, fit: BoxFit.cover),
              title: products[index]["title"]!,
              description: products[index]["desc"]!,
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final Image image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(description, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

