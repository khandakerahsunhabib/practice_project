import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassNoTEController =
      TextEditingController(text: '1');

  List<WaterTrack> waterTrackList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildWaterTrackCounter(),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final WaterTrack waterTrack = waterTrackList[index];
                return _buildWaterTrackListTile(index);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: waterTrackList.length,
            ),
          ),
        ],
      ),
    );
  }

  ListTile _buildWaterTrackListTile(index) {
    WaterTrack waterTrack = waterTrackList[index];
    return ListTile(
      title: Text('${waterTrack.dateTime.hour}:${waterTrack.dateTime.minute}'),
      subtitle: Text(
          '${waterTrack.dateTime.day}/${waterTrack.dateTime.month}/${waterTrack.dateTime.year}'),
      leading: CircleAvatar(child: Text('${waterTrack.noOfGlasses}')),
      trailing: IconButton(
        onPressed: () => _onTapRemoveWaterTrack(index),
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }

  Column _buildWaterTrackCounter() {
    return Column(
      children: [
        Text(
          getTotalGlassCount().toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text('Glass/s'),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 58,
              child: TextField(
                controller: _glassNoTEController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              onPressed: _onTapAddNewWaterTrack,
              child: const Text('Add'),
            )
          ],
        ),
      ],
    );
  }

  int getTotalGlassCount() {
    int counter = 0;
    for (WaterTrack t in waterTrackList) {
      counter += t.noOfGlasses;
    }
    return counter;
  }

  void _onTapAddNewWaterTrack() {
    if (_glassNoTEController.text.isEmpty) {
      _glassNoTEController.text = '1';
    }
    final int noOfGlasses = int.tryParse(_glassNoTEController.text) ?? 1;
    WaterTrack waterTrack = WaterTrack(
      noOfGlasses: noOfGlasses,
      dateTime: DateTime.now(),
    );
    waterTrackList.add(waterTrack);
    setState(() {});
  }

  void _onTapRemoveWaterTrack(int index) {
    waterTrackList.removeAt(index);
    setState(() {});
  }

  @override
  void dispose() {
    _glassNoTEController.dispose();
    super.dispose();
  }
}

class WaterTrack {
  final int noOfGlasses;
  final DateTime dateTime;

  WaterTrack({required this.noOfGlasses, required this.dateTime});
}
