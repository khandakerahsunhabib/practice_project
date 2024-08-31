import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Water Tracker App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildWaterTrackCounter(),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return _buildWaterTrackListTile(index);
                },
                itemCount: waterTrackList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWaterTrackListTile(index) {
    WaterTrack waterTrack = waterTrackList[index];
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('hh:mm a').format(now);
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return _singleTileDecoration(
        waterTrack, formattedDate, formattedTime, index);
  }

  Widget _singleTileDecoration(WaterTrack waterTrack, String formattedDate,
      String formattedTime, index) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue.shade50,
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(
          '${waterTrack.noOfGlasses} Glass of water',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text('$formattedDate, $formattedTime'),
        leading: Image.asset(
          'assets/images/water.png',
          width: 50,
        ),
        trailing: IconButton(
          onPressed: () => _onTapRemoveWaterTrack(index),
          icon: Image.asset(
            'assets/images/delete.png',
            width: 35,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _buildWaterTrackCounter() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: _waterTrackerBoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            getTotalGlassCount().toString(),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.green,
            ),
          ),
          const Text(
            'Glasses of Water You Drank',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 58,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  controller: _glassNoTEController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: _onTapAddNewWaterTrack,
                child: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    color: Colors.white,
                    Icons.add,
                    size: 30,
                    weight: 10,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  BoxDecoration _waterTrackerBoxDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
          spreadRadius: 1, // The spread of the shadow
          blurRadius: 7, // The blur effect of the shadow
          offset: const Offset(0, 2), // Position of the shadow (x, y)
        ),
      ],
      borderRadius: BorderRadius.circular(15),
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/images/water-tracker-bg.jpg'),
      ),
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
