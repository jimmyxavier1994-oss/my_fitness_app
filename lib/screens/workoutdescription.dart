import 'package:flutter/material.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final String title;
  final String desc;

  const ExerciseDetailScreen({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    // Default steps — you can modify later
    final List<String> steps = [
      "Keep your back straight",
      "Lower your body slowly",
      "Push yourself up with control",
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Text(desc, style: TextStyle(color: Colors.white70)),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                "Steps:",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: steps.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(
                    title: Text(
                      "steps${index + 1}:, ${steps[index]}",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      side: BorderSide(color: Colors.red),
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
