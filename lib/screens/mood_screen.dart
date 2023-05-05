import 'package:flutter/material.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const MoodSelector(),
    );
  }
}

class MoodSelector extends StatefulWidget {
  const MoodSelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MoodSelectorState createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  String _selectedMood = "";

  void _selectMood(String mood) {
    setState(() {
      _selectedMood = mood;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _selectMood("Happy"),
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedMood == "Happy" ? Colors.blue : null,
              ),
              child: const Text(
                "Happy 😊",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectMood("Sad"),
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedMood == "Sad" ? Colors.blue : null,
              ),
              child: const Text(
                "sad 😢 ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () => _selectMood("Angry"),
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedMood == "Angry" ? Colors.blue : null,
              ),
              child: const Text(
                "Angry 😠",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectMood("Excited"),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _selectedMood == "Excited" ? Colors.blue : null,
              ),
              child: const Text(
                " Crazy 🤩",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        )
      ],
    );
  }
}
