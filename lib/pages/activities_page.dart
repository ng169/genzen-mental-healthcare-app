import 'package:flutter/material.dart';
import 'package:mental_health/components/custom_list_tile.dart';
import 'package:mental_health/screens/journal_screen.dart';
import 'package:mental_health/screens/meditation_screen.dart';
import 'package:mental_health/screens/mood_screen.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: const [
          CustomListTile(
            path: 'assets/animations/meditation-timer.json',
            title: 'Meditation',
            subtitle: 'Finding Peace Within',
            screen: MeditationScreen(),
          ),
          CustomListTile(
            path: 'assets/animations/book-flipping.json',
            title: 'Journal',
            subtitle: ' A Personal Journey of Reflection and Growth',
            screen: JournalScreen(),
          ),
          CustomListTile(
              path: 'assets/animations/emoji.json',
              title: 'Mood',
              subtitle: 'Track Your Emotions',
              screen: MoodScreen())
          // CustomListTile(),
        ],
      ),
    );
  }
}
