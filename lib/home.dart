import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Practice Project",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Flexible(
          //   flex: 2,
          //   child: Container(
          //     width: 150,
          //     height: MediaQuery.sizeOf(context).height,
          //     color: Colors.blue,
          //   ),
          // ),
          // Flexible(
          //   flex: 3,
          //   child: Container(
          //     color: Colors.grey,
          //     width: 210,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     color: Colors.red,
          //     width: 210,
          //     height: 100,
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     color: Colors.pink,
          //     width: 210,
          //     height: 100,
          //   ),
          // ),
          AspectRatio(
            aspectRatio: 9 / 9,
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
