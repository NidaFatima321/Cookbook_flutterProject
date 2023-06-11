import 'package:classtest/fastfood.dart';
import 'package:classtest/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [Text("RECIPE")],
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text("COOKBOOK",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                Text("COOKBOOK"),
                Icon(Icons.search)
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CATEGORIES",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              "Healthy and Nutritious Recipies",
              style: TextStyle(fontSize: 19, color: Colors.grey[700]),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
                  width: 180,
                  height: 180,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FASTFOOD(),));
                        },
                          child: Image.network(
                              "https://cdn-icons-png.flaticon.com/512/3272/3272779.png")),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7, vertical: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
                  width: 180,
                  height: 180,
                  child: Column(
                    children: [
                      Image.network(height:150,
                          "https://img.freepik.com/premium-vector/big-collection-different-fresh-vegetables_259139-164.jpg?w=2000"),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
                  width: 180,
                  height: 180,
                  child: Column(
                    children: [
                      Image.network(
                          "https://cdn-icons-png.flaticon.com/512/3272/3272779.png"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
                  width: 180,
                  height: 180,
                  child: Column(
                    children: [
                      Image.network(
                          "https://cdn-icons-png.flaticon.com/512/3272/3272779.png"),
                    ],
                  ),
                )
              ],
            ),
            // Expanded(
            //   child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            //     stream: FirebaseFirestore.instance.collection("Recipes").snapshots(),
            //     builder: (context, dynamic snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //             child:
            //             CircularProgressIndicator()); //return means the bottom code wont run
            //       }
            //       if (snapshot.data == null || snapshot.hasError) {
            //         return const Center(child: Text("DATA NOT AVAILABLE"));
            //       }
            //       maindatasnap=snapshot.data.docs[0];
            //       return Text("DATA FOUND");
            //
            //     },),
            // )
          ],
        ),
      ),
    );
  }
}
