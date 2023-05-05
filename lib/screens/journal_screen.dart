import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mental_health/components/lottie_widget.dart';
import 'package:mental_health/pages/login_or_register_page.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  TextEditingController field1 = TextEditingController();
  TextEditingController field2 = TextEditingController();
  TextEditingController field3 = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    field1.text = ""; //innitail value of text field
    field2.text = "";
    field3.text = "";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gratitude"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Write three points on gratitude!',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  decorationColor: Colors.redAccent,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              TextField(
                  controller: field1,
                  decoration: const InputDecoration(
                    labelText: "I am grateful for",
                    icon: Icon(Icons.monitor_heart_sharp),
                  )),
              TextField(
                  controller: field2,
                  decoration: const InputDecoration(
                    labelText: "I am grateful for",
                    icon:
                        Icon(Icons.monitor_heart_sharp), //icon at head of input
                  )),
              TextField(
                  controller: field3,
                  decoration: const InputDecoration(
                    icon: Icon(
                        Icons.monitor_heart_rounded), //icon at head of input
                    //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                    labelText: "I am grateful for",
                    //icon at tail of input
                  )),
              const SizedBox(
                height: 10,
                // <-- SEE HERE
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      // <-- Icon
                      Icons.share,
                      size: 24.0,
                    ),
                    label: const Text('Share'), // <-- Text
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _firestore
                          .collection('userdata')
                          .doc(loggedInUser!.email!)
                          .collection('dailydata')
                          .doc(DateFormat('ddMMyyyy').format(DateTime.now()))
                          .update({
                        'Journal 1': field1.text,
                        'Journal 2': field2.text,
                        'Journal 3': field3.text,
                        'isJourDone': true,
                      });
                      field1.clear();
                      field2.clear();
                      field3.clear();
                    },
                    icon: const Icon(
                      // <-- Icon
                      Icons.save,
                      size: 24.0,
                    ),
                    label: const Text('Save'), // <-- Text
                  ),
                ],
              ),
              const LottieWidget(path: 'assets/animations/writing.json'),
            ],
          ),
        ),
      ),
    );
  }
}
