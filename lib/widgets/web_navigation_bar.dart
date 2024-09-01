import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebNavigationBar extends StatelessWidget {
  const WebNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 150,
              child: Text(
                "HUMMING BIRD .",
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                  fontWeight: FontWeight.w600,
                ),
              )),
          Row(
            children: [
              Text('Episodes'),
              SizedBox(
                width: 50,
              ),
              Text('About'),
            ],
          )
        ],
      ),
    );
  }
}
