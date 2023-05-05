import 'package:flutter/material.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var arrNames = ['hii', 'hello', 'yeap'];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Goals',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          // Text('Start a New Challenge',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue),),
          Container(
            margin: EdgeInsets.only(left: 15, bottom: 20, right: 20),
            padding: EdgeInsets.only(
                left: 15,
                bottom: 20,
                right: 20,
                top: 10), //apply padding to some sides only
            child: Text("Start a New Challenge",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              margin: EdgeInsets.all(10),
              padding:
                  EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 10),
              child: ListTile(
                leading: Image(
                  image: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/004/191/267/original/exercise-color-icon-man-workout-gym-activity-athlete-with-dumbell-training-and-bodybuilding-personal-coach-healthcare-physical-wellness-person-stretching-isolated-illustration-vector.jpg'),
                ),
                title: Text(
                  'Get Fit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                    ),
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FirstRoute()),
                        )),
              )),
          Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              padding:
                  EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 10),
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Image(
                  image: AssetImage('assets/images/sleep.jpeg'),
                ),
                title: Text(
                  'Better Sleep',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                    ),
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ThirdRoute()),
                        )),
              )),
          Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              padding:
                  EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 10),
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Image(
                  image: AssetImage('assets/images/live.jpg'),
                ),
                title: Text(
                  'Live Healtier',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                    ),
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondRoute()),
                        )),
              )),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Healtier'),
        centerTitle: true,
      ),
      body: Container(
        // child: ElevatedButton(
        //   onPressed: () {
        //     // Navigate back to first route when tapped.
        //
        //       Navigator.pop(context);
        //   },
        padding: EdgeInsets.all(30),
        child: Text(
          '1.Exercise can improve your physical health, mental health, and mood. Aim to exercise for at least 30 minutes a day, five days a week.\n \n 2.Make sure you are eating plenty of fruits, vegetables, whole grains, lean proteins, and healthy fats. Avoid processed and junk foods as much as possible',
          style: TextStyle(fontSize: 25, color: Colors.black),
          maxLines: 10,
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Better Sleep'),
        centerTitle: true,
      ),
      body: Container(
        // child: ElevatedButton(
        //   onPressed: () {
        //     // Navigate back to first route when tapped.
        //
        //       Navigator.pop(context);
        //   },
        padding: EdgeInsets.all(30),

        child: const Text(
          " 1.Try to go to bed and wake up at the same time every day, even on weekends. This helps regulate your body's internal clock and can improve the quality of your sleep.\n\n 2. Create a relaxing bedtime routine to help signal to your body that it's time to sleep. This might include taking a warm bath, reading a book, or practicing meditation or yoga.",
          style: TextStyle(fontSize: 25, color: Colors.black),
          maxLines: 20,
        ),
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Fit'),
        centerTitle: true,
      ),
      body: Container(
        // child: ElevatedButton(
        //   onPressed: () {
        //     // Navigate back to first route when tapped.
        //
        //       Navigator.pop(context);
        //   },
        padding: EdgeInsets.all(30),
        child: const Text(
          ' 1.Set clear goals for what you want to achieve and create a plan to help you get there. Consider factors such as your fitness level, time available, and any equipment you may need.\n \n 2.Choose activities that you find enjoyable, such as jogging, swimming, cycling or weightlifting. This will help you stay motivated and make it easier to stick to your fitness routine. ',
          style: TextStyle(fontSize: 25, color: Colors.black),
          maxLines: 20,
        ),
      ),
    );
  }
}
