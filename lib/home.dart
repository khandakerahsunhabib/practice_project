import 'package:flutter/material.dart';

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
      body: Container(
        width: 320,
        height: 300,
        child: Column(
          children: [
            LayoutBuilder(
              key: key,
              builder: (context, BoxConstraints constraint) {
                print(MediaQuery.sizeOf(context).width);
                print(constraint.maxWidth);
                if (constraint.maxWidth > 150) {
                  return Text('400');
                } else if (constraint.maxWidth > 350) {
                  return Text("350");
                } else {
                  return Text("Default");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
