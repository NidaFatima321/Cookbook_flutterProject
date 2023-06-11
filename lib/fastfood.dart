import 'package:classtest/burgers.dart';
import 'package:classtest/main.dart';
import 'package:classtest/pizza.dart';
import 'package:classtest/spring_roll.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FASTFOOD extends StatefulWidget {
  const FASTFOOD({Key? key}) : super(key: key);

  @override
  State<FASTFOOD> createState() => _FASTFOODState();
}

class _FASTFOODState extends State<FASTFOOD> {
  PageController pageController = new PageController();
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("FASTFOOD"),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FASTFOOD',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      num=0;
                      pageController.animateToPage(0,
                          duration: Duration(milliseconds: 3),
                          curve: Curves.linear);
                      setState(() {

                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          color: num==0?Colors.green:Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ]),
                      child: Row(
                        children: [
                          Icon(
                            Icons.dinner_dining_rounded,
                            color: num==0?Colors.white:Colors.black,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "BURGER",
                            style: TextStyle(
                                color: num==0?Colors.white:Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      num=1;
                      pageController.animateToPage(1,
                          duration: Duration(milliseconds: 3),
                          curve: Curves.bounceIn);
                      setState(() {

                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          color: num==1?Colors.green:Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ]),
                      child: Row(
                        children: [
                          Icon(Icons.local_pizza,color: num==1?Colors.white:Colors.black,),
                          Text(
                            "PIZZA",
                            style: TextStyle(letterSpacing: 2.5,color: num==1?Colors.white:Colors.black),

                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      num=2;
                      pageController.animateToPage(2,
                          duration: Duration(milliseconds: 3),
                          curve: Curves.linear);
                      setState(() {

                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          color: num==2?Colors.green:Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ]),
                      child: Row(
                        children: [
                          Icon(Icons.dining,color: num==2?Colors.white:Colors.black,),
                          Text(
                            "SPRING ROLLS",
                            style: TextStyle(letterSpacing: 2.5,color: num==2?Colors.white:Colors.black,),

                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PageView(
                    controller: pageController,
                    children: [Burgers(), Pizza(), SpringRolls()],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
