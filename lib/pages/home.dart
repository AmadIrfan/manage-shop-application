// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '/widgets/floating_action_btn.dart';
import 'add_products.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: TopAppBar.appBar('home', actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddProducts(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ]),
      ),
      body: const Column(
        children: [],
      ),
      floatingActionButton: FloatingBtn(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddProducts(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      drawer: const Drawer(),
    );
  }
}
