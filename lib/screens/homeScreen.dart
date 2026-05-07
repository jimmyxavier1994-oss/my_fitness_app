import 'package:flutter/material.dart';
import 'package:myfitness/screens/CalorieCountScreen.dart';
import 'package:myfitness/screens/waterTrackerscree.dart';
import 'package:myfitness/screens/workoutPage.dart';
import 'package:myfitness/utility/featueCard.dart';
import 'package:myfitness/utility/infoCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cup = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "My Fitness",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hello",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),

            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                "Ready for today's Workout?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Todays Workout Plan Here",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Full Body Burnout - 45 mins",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FeatureCard(
                  title: "Workout",
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WorkoutPage();
                        },
                      ),
                    );
                  },
                ),
                FeatureCard(title: "Tracker", onpress: () {}),
                FeatureCard(title: "Progress", onpress: () {}),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                final int? cups = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WaterTrackerScreen();
                    },
                  ),
                );
                setState(() {
                  cup = cups!;
                });
              },
              child: infoCard(title: "Water intake", data: "$cup/8"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CalorieCountScreen();
                    },
                  ),
                );
              },
              child: infoCard(title: "Calorie Burned", data: "0"),
            ),
          ],
        ),
      ),
    );
  }
}
