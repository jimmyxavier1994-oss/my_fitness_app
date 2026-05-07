import 'package:flutter/material.dart';
import 'package:myfitness/screens/workoutPage.dart';
import 'package:myfitness/screens/workoutdescription.dart';

class ExercisePage extends StatelessWidget {
  final categoryName;
  ExercisePage({super.key, required this.categoryName});
  final exerciseData = {
    "Full Body": [
      {"title": "Burpees", "desc": "Full body explosive movement"},
      {"title": "Mountain Climbers", "desc": "Core & cardio"},
      {"title": "Jumping Jacks", "desc": "Warm up & conditioning"},
    ],
    "Chest": [
      {"title": "Push Ups", "desc": "Upper body push exercise"},
      {"title": "Incline Push Ups", "desc": "Targets upper chest"},
      {"title": "Wide Push Ups", "desc": "Outer chest emphasis"},
    ],
    "Back": [
      {"title": "Superman", "desc": "Lower back activation"},
      {"title": "Reverse Snow Angel", "desc": "Upper back mobility"},
    ],
    "Legs": [
      {"title": "Squats", "desc": "Targets quads & glutes"},
      {"title": "Lunges", "desc": "Unilateral leg strength"},
      {"title": "Calf Raises", "desc": "Strengthen calves"},
    ],
    "Shoulders": [
      {"title": "Pike Push Ups", "desc": "Shoulder press alternative"},
      {"title": "Arm Circles", "desc": "Warm-up & stability"},
    ],
    "Arms": [
      {"title": "Diamond Push Ups", "desc": "Triceps focus"},
      {"title": "Tricep Dips", "desc": "Bodyweight triceps workout"},
    ],
    "Core": [
      {"title": "Plank", "desc": "Isometric core hold"},
      {"title": "Crunches", "desc": "Upper abs activation"},
      {"title": "Leg Raises", "desc": "Lower abs strengthening"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final exercise = exerciseData[categoryName];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          categoryName,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exercise!.length,
              itemBuilder: (context, index) {
                final data = exercise[index];
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(
                    title: Text(
                      data["title"]!,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      data["desc"]!,
                      style: TextStyle(color: Colors.white70),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      side: BorderSide(color: Colors.red),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ExerciseDetailScreen(
                                title: data["title"]!,
                                desc: data["desc"]!,
                              );
                            },
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
