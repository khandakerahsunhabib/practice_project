import 'package:flutter/material.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage(''),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/shirt.jpg',
                    width: 100,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pullover"),
                      Row(
                        children: [
                          Text("Color: Black"),
                          Text("Size: L"),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.minimize,
                              ),
                            ),
                          ),
                          Text("1"),
                          CircleAvatar(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.menu,
                      ),
                      Text("51")
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
