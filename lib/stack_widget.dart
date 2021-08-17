// import 'package:flutter/material.dart';

// class StackWidget extends StatefulWidget {
//   const StackWidget({Key? key}) : super(key: key);

//   @override
//   _StackWidget createState() => _StackWidget();
// }

// class _StackWidget extends State<StackWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: size.height * 0.02),
//       color: Colors.red,
//       child: Container(
//         width: MediaQuery.of(context)size.width * 0.8,
//         child: Stack(
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 20),
//              width: MediaQuery.of(context)size.width * 0.8,
//               height: MediaQuery.of(context)size.height * 0.15,
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             Positioned(
//               bottom: 20,
//               child: Container(
//                  width: MediaQuery.of(context)size.width * 0.3,
//                  height: MediaQuery.of(context)size.height * 0.15,
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
