import 'package:classtest/recipe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
        home: RecipePage(),
      )
  );
}
DocumentSnapshot? maindatasnap;
CollectionReference? collectionReference;
//
// class MyQuiz extends StatelessWidget {
//   const MyQuiz({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//       home: Scaffold(
//         backgroundColor: Colors.teal,
//         body: SafeArea(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 color: Colors.red,
//                 width: 100,
//                 height: 600,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     color: Colors.yellow,
//                     width: 100,
//                     height: 100,
//                   ),
//                   Container(
//                     color: Colors.green,
//                     width: 100,
//                     height: 100,
//                   )
//                 ],
//               ),
//               Container(
//                 width: 100,
//                 height: 600,
//                 color: Colors.blue[700],
//               )
//             ],
//           ),
//         ),
//       )
//     );
//   }
// }
