import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int userChoice = 0;
  int systemChoice = 0;
  selectChoice(int numPic) {
    setState(() {
      userChoice = numPic;
      systemChoice = Random().nextInt(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff002f6c),
        appBar: AppBar(
            title: const Text("Stone Paper Scissors"),
            backgroundColor: const Color(0xff002f6c)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                children: [
                  Expanded(child: Image.asset("Images/btn$userChoice.png")),
                  const Text(
                    "VS",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Expanded(
                      // child: TextButton(
                      //     onPressed: () {},
                      child: Image.asset("Images/btn$systemChoice.png")),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "You",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  child: const Text(
                    "System",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    selectChoice(0);
                  },
                  // onPressed: () {
                  //   setState(() {
                  //     userChoice = 0;
                  //     systemChoice = Random().nextInt(3);
                  //   });
                  //},
                  child: Image.asset(
                    "Images/btn0.png",
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        selectChoice(1);
                      },
                      // onPressed: () {
                      //   userChoice = 2;
                      // },
                      child: Image.asset(
                        "Images/btn1.png",
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    TextButton(
                      onPressed: () {
                        selectChoice(2);
                      },
                      // onPressed: () {
                      //   setState(() {
                      //     userChoice = 1;
                      //   });
                      // },
                      child: Image.asset(
                        "Images/btn2.png",
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
