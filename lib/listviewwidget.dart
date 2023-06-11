import 'package:classtest/recipe.dart';
import 'package:classtest/recipe_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LisViewWidget extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  const LisViewWidget({Key? key, required this.documentSnapshot}) : super(key: key);
  @override
  State<LisViewWidget> createState() => _LisViewWidgetState();
}

class _LisViewWidgetState extends State<LisViewWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Recipes(docsn: widget.documentSnapshot,),));
          },
          child: Card(
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(widget.documentSnapshot["Image"])),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.documentSnapshot["Name"],
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          width:constraints.maxWidth*0.6,
                          child: Text(widget.documentSnapshot["Description"]),
                        ),
                        Row(
                          children: [
                            Text(widget.documentSnapshot["Calories"],style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(width: constraints.maxWidth*0.45,),
                            Icon(Icons.thumb_up_alt_outlined)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
