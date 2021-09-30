
import 'package:bilgiyarismasi/model/view/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnaEkran extends StatelessWidget {
  const AnaEkran({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.pink[50],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(title:Text("BİLGİ YARIŞMASI"),
            backgroundColor: Colors.pink[200],
            centerTitle: true,),
           
           ElevatedButton(
             style: ButtonStyle(
            
             ),
             onPressed: (){
               Navigator.push(context,MaterialPageRoute(builder:(context)=>HomeView()));
             }, 
             child: Text("BAŞLA"),

             ),

          ],
        ),
      ),
    );
  }
}