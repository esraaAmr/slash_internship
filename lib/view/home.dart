import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slash_internship/view/products.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded,size: 30,),
          onPressed: () {

          },
        ),

        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Slash.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ViewProducts(),
      ),
    );
  }
}
