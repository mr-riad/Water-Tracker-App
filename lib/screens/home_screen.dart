import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            child: Container(
              margin: EdgeInsets.all(20),
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
                      value: 0.6, // 60%
                      strokeWidth: 15,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF6DD5FA),
                      ),
                      backgroundColor: Color(0xFF2980B9),
                    ),
                  ),
                  Text(
                    "60%",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text("+100l"),
            ),
          ),
        ],
      ),
    );
  }
}
