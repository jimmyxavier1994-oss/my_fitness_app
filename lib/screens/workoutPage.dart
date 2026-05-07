import 'package:flutter/material.dart';
import 'package:myfitness/exercisPage.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final List<Map<String, String>> categories = const [
    {"title": "Full Body", "desc": "Complete strength and conditioning"},
    {"title": "Chest", "desc": "Push strength & upper body"},
    {"title": "Back", "desc": "Pull strength & posture"},
    {"title": "Legs", "desc": "Quads, hamstrings & glutes"},
    {"title": "Shoulders", "desc": "Delts & upper stability"},
    {"title": "Arms", "desc": "Biceps & triceps blasting"},
    {"title": "Core", "desc": "Midsection strength & stability"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Workouts",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final item = categories[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      item['title']!,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      item['desc']!,
                      style: TextStyle(color: Colors.white70),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ExercisePage(categoryName: item['title']!);
                            },
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.red, width: 2),
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
