import 'package:flutter/material.dart';

class CalorieCountScreen extends StatefulWidget {
  const CalorieCountScreen({super.key});

  @override
  State<CalorieCountScreen> createState() => _CalorieCountScreenState();
}

class _CalorieCountScreenState extends State<CalorieCountScreen> {
  var namectr = TextEditingController();
  var calctr = TextEditingController();
  List foodname = [];
  List calorie = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(12),
            ),
            builder: (context) {
              return Container(
                decoration: BoxDecoration(color: Colors.black),
                height: 250,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: namectr,
                        style: TextStyle(color: Colors.red),
                        decoration: InputDecoration(
                          hintText: "Food Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: calctr,
                        style: TextStyle(color: Colors.red),
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: "Calories",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                foodname.add(namectr.text);
                                calorie.add(calctr.text);
                                namectr.clear();
                                calctr.clear();
                              });
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.check,
                              size: 33,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calorie Counter", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: foodname.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          calorie.removeAt(index);
                          foodname.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                    title: Text(
                      foodname[index],
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(calorie[index].toString()),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red),
                      borderRadius: BorderRadiusGeometry.circular(12),
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
