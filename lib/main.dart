import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
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
  double userScale = 0.0;
  double Userturns = 0.0;
  double UserOp = 0.0;
  int youScore = 0;
  int SysteScore = 0;

  bool isPlay = false;

  Duration duration = const Duration(milliseconds: 200);
  song(int numMusic) {
    AudioPlayer player = AudioPlayer();
    player.play(AssetSource("note$numMusic.wav"));
  }

  selectChoice(int numPic) {
    isPlay = true;
    userChoice = numPic;
    systemChoice = Random().nextInt(3);

    setState(() {
      // userScale += 1.0;
      // Userturns += 2.0;
      // UserOp += 1.0;
      song(numPic);
      ResultWinner();
    });
    Timer(const Duration(seconds: 1), () {
      setState(() {
        isPlay = false;
      });

      // userScale = 0.0;
      // Userturns = 0.0;
      // UserOp = 0.0;
    });
  }

  //2 مقص
  //حجر 1
  //0ورقة
  ResultWinner() {
    if ((userChoice == 0 && systemChoice == 1) ||
        (userChoice == 2 && systemChoice == 0) ||
        (userChoice == 1 && systemChoice == 2)) {
      youScore++;
    } else {
      SysteScore++;
    }
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
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: AnimatedOpacity(
                opacity: isPlay ? 1 : 0, // UserOp,
                duration: duration,
                curve: Curves.easeInCirc,
                child: AnimatedRotation(
                  turns: isPlay ? 2 : 0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInCirc,
                  child: AnimatedScale(
                    scale: isPlay ? 1 : 0,
                    duration: duration,
                    curve: Curves.easeInCirc,
                    child: Column(
                      children: [
                        Image.asset(
                          "Images/btn0.png",
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "Images/btn1.png",
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Image.asset(
                              "Images/btn2.png",
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedScale(
                    scale: isPlay ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset("Images/btn$userChoice.png"),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text(
                      "VS",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  AnimatedScale(
                    scale: isPlay ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset("Images/btn$systemChoice.png"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "You",
                  style: TextStyle(
                      fontSize: 18,
                      //  fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  child: const Text(
                    "System",
                    style: TextStyle(
                        fontSize: 18,
                        //  fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 55,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
