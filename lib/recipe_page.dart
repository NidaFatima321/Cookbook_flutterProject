import 'package:classtest/calorie_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Recipes extends StatefulWidget {
  final DocumentSnapshot docsn;
  const Recipes({Key? key, required this.docsn}) : super(key: key);
  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'H3R1y1ADCZw',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.docsn["Name"],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: "Times New Roman"),
              ),
              Text(
                  widget.docsn["Description"],
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(
                    "Nutritions",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
              Row(
                children: [
                  Column(
                    children: [
                      CalorieCard(),
                      CalorieCard(),
                      CalorieCard(),
                    ],
                  ),
                  SizedBox(width: 10),
                  Image.network(
                    widget.docsn["Image"],
                    width: 220,
                  )
                ],
              ),
              Text(
                "Ingredients",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    itemCount: widget.docsn["Ingredients"].length,
                    itemBuilder: (context, index) {
                        return Text(widget.docsn["Ingredients"][index],);
                  },
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Recipe Preparation",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(width:380,
                child: Text(
                  "bcghvgvdgvdgvasghvasghdvyqvdghsvhgdvqhgdvbas  ghcxvqgvvdghqw d qwgdgvqwguvdguqwvdguqw ghvdugqwwvdtyvqwgdvqs dyqigdyqwvgudvqwydyqwvqq qwhvdyuqwvdguqwvd wqwvdyiqwgvduwqvgqfv",
                  style: TextStyle(color: Colors.grey,fontSize: 17,fontFamily: "Times New Roman"),
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: Container(
        child: FloatingActionButton.extended(
          onPressed: (){
            showModalBottomSheet<void>(
              context: context, builder: (context) {
              return YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(
                    isExpanded: true,
                  )
                ],
                onReady:() {
                  _controller.load(_controller.initialVideoId);
                },
              );
            },);
          },
          label: Row(
            children: [
              Icon(Icons.video_collection_outlined),
              SizedBox(width:5),
              Text("Watch Video")
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
