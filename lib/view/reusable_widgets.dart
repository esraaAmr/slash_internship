import 'package:flutter/material.dart';

Widget reusableScaffold(body,title,Function backFn){
  return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            backFn();
          },
        ),

        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: body,
    );
}