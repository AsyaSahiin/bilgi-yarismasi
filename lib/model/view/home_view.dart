// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:bilgiyarismasi/model/NetworkManager.dart';
import 'package:bilgiyarismasi/model/question.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  Question? question;
  String err = "";
  int puan = 0;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      question = await NetworkManager.instance.getQuestions();
      setState(() {});
    } catch (e) {
      err = e.toString();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: err.isNotEmpty
            ? Center(
                child: Text(err),
              )
            : question == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              question!.results![selectedIndex].question
                                  .toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      ...buildAnswer(question!.results![selectedIndex]),
                    ],
                  ),
      ),
    );
  }

  List<Widget> buildAnswer(Results soru) {
    final _random = new Random();
    int r = 0 + _random.nextInt(soru.incorrectAnswers!.length - 1);
    print(r);
    List<String> cevaplar = [];
    cevaplar = [...soru.incorrectAnswers!];
    cevaplar.insert(r, soru.correctAnswer!);
    return List.generate(cevaplar.length, (index) {
      return Card(
        child: ListTile(
          title: Text(cevaplar[index]),
          onTap: () => nextQuestion(soru, cevaplar[index]),
        ),
      );
    });
  }

  void nextQuestion(Results soru, String answer) {
    if (soru.correctAnswer == answer) {
      puan += 10;
      setState(() => selectedIndex++);
    } else {
      // GAME OVER.
    }
  }
}
