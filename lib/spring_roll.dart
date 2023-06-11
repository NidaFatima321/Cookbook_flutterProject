import 'package:classtest/listviewwidget.dart';
import 'package:classtest/sliderwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SpringRolls extends StatefulWidget {
  const SpringRolls({Key? key}) : super(key: key);

  @override
  State<SpringRolls> createState() => _SpringRollsState();
}

class _SpringRollsState extends State<SpringRolls> {
  List<String> newlist = [
    "https://images.freeimages.com/images/previews/a36/poppyseed-burger-1641675.jpg",
    "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://media.istockphoto.com/id/1355304506/photo/shot-of-a-waitress-serving-a-burger-with-fries-at-a-restaurant.jpg?b=1&s=612x612&w=0&k=20&c=B39kF1BNvdKrCZf8KK5GS13X5UbZmCN-kQJWXXa69a8=",
    "https://images.freeimages.com/images/previews/a36/poppyseed-burger-1641675.jpg",
    "https://media.istockphoto.com/id/1355304506/photo/shot-of-a-waitress-serving-a-burger-with-fries-at-a-restaurant.jpg?b=1&s=612x612&w=0&k=20&c=B39kF1BNvdKrCZf8KK5GS13X5UbZmCN-kQJWXXa69a8="
  ];
  int count = 0;
  List<DocumentSnapshot> docssnaps = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("Recipes").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); //return means the bottom code wont run
          }
          if (snapshot.data == null || snapshot.hasError) {
            return const Center(child: Text("DATA NOT AVAILABLE"));
          }
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            if (snapshot.data!.docs[i]["Category"] == "SpringRolls" &&
                count <= 3) {
              count = count + 1;
              docssnaps.add(snapshot.data!.docs[i]);
            }
          }

          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SPRING ROLLS",
                  style: TextStyle(fontFamily: "Pacifico", fontSize: 20),
                ),
                CarouselSlider.builder(
                  itemCount: count,
                  itemBuilder: (context, index, realIndex) {
                    return SliderWidget(
                      // image: docssnaps[index]["Image"],
                      // cal: docssnaps[index]["Calories"],
                      documentSnapshot: docssnaps[index],
                    );
                  },
                  options: CarouselOptions(
                    height: 265,
                    // aspectRatio: 5/9,
                    viewportFraction: 0.6,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    // enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Text(
                  "POPULAR RECIPES",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      List<Widget> mywidget = [];
                      if (snapshot.data!.docs[index]["Category"] ==
                          "SpringRolls") {
                        mywidget.add(LisViewWidget(
                          documentSnapshot: snapshot.data!.docs[index],
                        ));
                      }
                      return Container(
                        child: Column(
                          children: mywidget,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
