import 'dart:math';


import 'package:flutter/material.dart';
import 'package:hw3/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Hesaplayici',
      debugShowCheckedModeBanner: false,
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  double heightOfPerson = 170;
  double weightOfPerson = 60;
  double ageOfPerson = 25;
  String choosenGender = 'm';

  String idealBMI(double age) {
    String ideal = "";

    if (age >= 18 && age <= 24) {
      ideal = "19-24";
    } else if (age > 24 && age <= 35) {
      ideal = "20-25";
    } else if (age > 35 && age <= 44) {
      ideal = "21-26";
    } else if (age > 45 && age <= 54) {
      ideal = "22-27";
    } else if (age > 54 && age <= 64) {
      ideal = "23-28";
    } else if (age > 65) {
      ideal = "24-29";
    }

    return ideal;
  }

  @override
  Widget build(BuildContext context) {
    var screenRes = MediaQuery.of(context);
    final double height = screenRes.size.height;
    final double width = screenRes.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Hesaplayıcı",
          style: TextStyle(
              fontFamily: "Yanone", fontSize: height / 30, color: Colors.white),
        ),
        backgroundColor: appBarBGColor,
      ),
      backgroundColor: bodyBGColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    choosenGender = 'm';
                  });
                },
                child: Container(
                  width: width / 2.5,
                  height: height / 8,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      choosenGender == 'm'
                          ? const BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(3, 0),
                            )
                          : BoxShadow(),
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("images/maleicon.png"),
                        Text(
                          "ERKEK",
                          style: TextStyle(
                              fontSize: height / 40, color: Colors.white),
                        )
                      ]),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  choosenGender = "f";
                }),
                child: Container(
                  width: width / 2.5,
                  height: height / 8,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      choosenGender == 'f'
                          ? const BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(3, 0),
                            )
                          : BoxShadow(),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("images/femaleicon.png"),
                      Text(
                        "KADIN",
                        style: TextStyle(
                            fontSize: height / 40, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: width / 1.25,
            height: height / 5,
            decoration: const BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "BOY ",
                  style: TextStyle(
                      fontSize: height / 30,
                      fontFamily: "Yanone",
                      color: Colors.grey),
                ),
                Text(
                  "${heightOfPerson.toInt()} cm",
                  style: TextStyle(
                    fontSize: height / 50,
                    color: Colors.grey,
                  ),
                ),
                Slider(
                    min: 100,
                    max: 250,
                    value: heightOfPerson,
                    activeColor: appBarBGColor,
                    inactiveColor: Colors.white,
                    onChanged: (double height) {
                      setState(() {
                        heightOfPerson = height;
                      });
                    }),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: width / 2.5,
                height: height / 8,
                decoration: const BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "KİLO",
                      style: TextStyle(
                          fontSize: height / 35,
                          fontFamily: "Yanone",
                          color: Colors.grey),
                    ),
                    Text(
                      "${weightOfPerson.toInt()} kg",
                      style: TextStyle(
                          color: Colors.grey, fontSize: height / 58.33),
                    ),
                    Slider(
                        min: 40,
                        max: 250,
                        value: weightOfPerson,
                        activeColor: appBarBGColor,
                        inactiveColor: Colors.white,
                        onChanged: (double weight) {
                          setState(() {
                            weightOfPerson = weight;
                          });
                        }),
                  ],
                ),
              ),
              Container(
                width: width / 2.5,
                height: height / 8,
                decoration: const BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "YAŞ",
                      style: TextStyle(
                          fontFamily: "Yanone",
                          fontSize: height / 35,
                          color: Colors.grey),
                    ),
                    Text(
                      "${ageOfPerson.toInt()}",
                      style: TextStyle(
                          fontFamily: "Yanone",
                          fontSize: height / 50,
                          color: Colors.grey),
                    ),
                    Slider(
                        min: 15,
                        max: 100,
                        value: ageOfPerson,
                        activeColor: appBarBGColor,
                        inactiveColor: Colors.white,
                        onChanged: (double age) {
                          setState(() {
                            ageOfPerson = age;
                          });
                        }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: appBarBGColor,
        child: InkWell(
          onTap: () {
            
            double bmi = weightOfPerson / pow((heightOfPerson / 100), 2);
            

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        side: BorderSide(color: appBarBGColor)),
                    backgroundColor: bodyBGColor,
                    title: const Text("Vücut Kitle İndeksiniz:"),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Vücut kitle indeksiniz: ${bmi.toStringAsFixed(1)}"),
                        Text(
                            "${ageOfPerson.toInt()} yaşı için ideal BMI: ${idealBMI(ageOfPerson)}"),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: const Text(
                          "Tamam",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                });
          },
          child: SizedBox(
            height: height / 15,
            width: double.infinity,
            child: const Center(
              child: Text(
                'HESAPLA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
