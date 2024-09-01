import 'package:flutter/material.dart';

class HumbergerMenu extends StatelessWidget {
  const HumbergerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: SafeArea(
        minimum: EdgeInsets.zero,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.teal.shade500,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SKILL UP NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Tap Here',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const ListTile(
              horizontalTitleGap: 30,
              leading: Icon(Icons.video_library_outlined),
              title: Text('Episodes'),
            ),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              horizontalTitleGap: 30,
              leading: Icon(Icons.sim_card_alert),
              title: Text('About'),
            )
          ],
        ),
      ),
    );
  }
}
