import 'package:flutter/material.dart';

class ChatModule extends StatefulWidget {
  const ChatModule({Key? key}) : super(key: key);

  @override
  State<ChatModule> createState() => _ChatModuleState();
}

class _ChatModuleState extends State<ChatModule> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.verified_user_outlined),
            Text("Welcome"),
            Icon(Icons.call),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 20),
       child: Column(
         children: [
           Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Icon(Icons.circle),
               Container(
                 decoration: BoxDecoration(
                 color: Colors.white,
                   borderRadius: BorderRadius.circular(5)
                 ),
                 padding: EdgeInsets.all(5),
                 child: Column(
                   children: [
                     Row(
                       children: [
                         Text("~name",style: TextStyle(color: Colors.indigo,fontSize: 15),),
                         SizedBox(width: 30,),
                         Text('+923363461189')
                       ],
                     ),
                     Text(
                       "This message was deleted"
                     )
                   ],
                 ),
               )
             ],
           )
         ],
       ), 
      )
    );
  }
}
