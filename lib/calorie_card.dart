import 'package:flutter/material.dart';
class CalorieCard extends StatefulWidget {
  const CalorieCard({Key? key}) : super(key: key);
  @override
  State<CalorieCard> createState() => _CalorieCardState();
}

class _CalorieCardState extends State<CalorieCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(13)
              ),
              child: Text("180"),
            ),
            SizedBox(width: 15,),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Calorie",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text("Kcal")
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
