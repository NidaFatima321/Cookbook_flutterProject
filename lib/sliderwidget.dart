import 'package:classtest/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  const SliderWidget({Key? key, required this.documentSnapshot}) : super(key: key);
  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: NetworkImage(widget.documentSnapshot["Image"]),height: 150,width:150),
          Text(widget.documentSnapshot["Name"],style: TextStyle(fontWeight: FontWeight.bold),),
          Text(widget.documentSnapshot["Description"],style: TextStyle(color: Colors.grey),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(widget.documentSnapshot["Calories"]),
              Icon(Icons.thumb_up_alt_outlined)
            ],
          )
        ],
      ),
    );
  }
}
