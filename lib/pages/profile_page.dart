import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/helper/check_doc_exists.dart';
import 'package:mental_health/pages/login_or_register_page.dart';
// import 'package:mental_health/components/user_data_widget.dart';
import 'package:mental_health/provider/date_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});
  dynamic userData;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginOrRegisterPage(),
        ),
      );
    }
  }

  Future getUserData(List<DateTime?> date) async {
    var collection = _firestore
        .collection('userdata')
        .doc(loggedInUser!.email!)
        .collection('dailydata');
    if (await checkIfDocExists(
        DateFormat('ddMMyyyy').format(date[0]!), collection)) {
      await collection
          .doc(DateFormat('ddMMyyyy').format(date[0]!))
          .get()
          .then((value) => widget.userData = value.data());
    } else {
      await collection.doc(DateFormat('ddMMyyyy').format(date[0]!)).set({
        "isMedDone": false,
        "isMoodDone": false,
        "isJourDone": false,
        "mood": "neutral",
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(),
          value: context.watch<DateProvider>().date,
          onValueChanged: (dates) =>
              context.read<DateProvider>().setDate(dates),
        ),
        FutureBuilder(
          future: getUserData(context.watch<DateProvider>().date),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Mood ${widget.userData["mood"]}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.userData["isMedDone"]
                        ? const Text("Meditation done")
                        : const Text("Meditation not done!"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.userData["isMoodDone"]
                        ? const Text("Mood done")
                        : const Text("Mood not done!"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.userData["isJourDone"]
                        ? Column(
                            children: [
                              const Text('Journal Done'),
                              const SizedBox(
                                height: 40,
                              ),
                              const Text('Journal Contents'),
                              Text(widget.userData["Journal 1"]),
                              Text(widget.userData["Journal 2"]),
                              Text(widget.userData["Journal 3"]),
                            ],
                          )
                        : const Text("Journal not done!"),
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        )
      ],
    );
  }
}
