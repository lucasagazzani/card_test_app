import 'package:flutter/material.dart';

class Scopri extends MaterialPageRoute<void> {
  Scopri()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
                title: const Text('Scopri'),
                elevation: 0,
                backgroundColor: Colors.black),
            body: Container(),
          );
        });
}
