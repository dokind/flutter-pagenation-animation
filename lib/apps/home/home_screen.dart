import 'package:flutter/material.dart';

import 'package:techpack_demo/apps/home/food_card.dart';
import 'package:techpack_demo/models/food_model.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key, required this.title});

  final String title;

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var _items = <FoodModel>[];
  var _isLoading = false;

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = false;
      _items = List.generate(
          _items.length + 20,
          (i) => FoodModel(
                name: 'Food $i',
                image: 'https://picsum.photos/200?random=food$i',
                price: '\$${i * 10}',
                description: 'Description $i',
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: InfiniteList(
        itemCount: _items.length,
        isLoading: _isLoading,
        onFetchData: _fetchData,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return FoodCard(food: _items[index]);
        },
      ),
    );
  }
}
