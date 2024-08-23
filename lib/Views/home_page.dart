
import 'package:ecommercebuying/constants.dart';
import 'package:flutter/material.dart';

class HomePageE extends StatelessWidget {
  const HomePageE({super.key});
static String id='HomePageE';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimeColor,
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
