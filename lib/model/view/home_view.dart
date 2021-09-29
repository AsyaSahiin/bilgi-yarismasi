import 'package:bilgiyarismasi/model/NetworkManager.dart';
import 'package:bilgiyarismasi/model/question.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
      getData();
  }
  void getData()async{
     Question? question=await NetworkManager.instance.getQuestions();
     var a="adad";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
    );
  }
}