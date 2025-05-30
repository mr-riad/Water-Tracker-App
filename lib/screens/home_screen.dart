import 'package:flutter/material.dart';

import '../utills/button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalCapacity = 2000;
  int currentIntake = 0;

  double get progress {
    return currentIntake / totalCapacity;
  }

  void addWater(int amount) {
    setState(() {
      if (currentIntake + amount <= totalCapacity) {
        currentIntake += amount;
      } else {
        currentIntake = totalCapacity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(
          "Water Tracker",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Center(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 10,
                    top: 20,
                    bottom: 20,
                  ),
                  padding: EdgeInsets.all(20),
                  height: 200,
                  width: 200,

                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 15,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF6DD5FA),
                          ),
                          backgroundColor: Color(0xFF2980B9),
                        ),
                      ),
                      Text(
                        "${(progress*100).toStringAsFixed(1)}%",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      "Capacity",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    subtitle: Text(
                      "2000L",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          CustomButton(text: "100L", onClick: () => addWater(100)),
          SizedBox(height: 10),

          CustomButton(text: "500 L", onClick: () => addWater(500)),

          SizedBox(height: 10),

          CustomButton(text: "1000 L", onClick: () => addWater(1000)),
        ],
      ),
    );
  }
}
