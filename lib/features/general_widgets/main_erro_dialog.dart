// import 'package:ck/config/theming/theming.dart';
// import 'package:ck/core/services/network/error_model.dart';
// import 'package:ck/features/general_widgets/spacing.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:talbat_teme/features/general_widgets/spacing.dart';

// class MainErrorDialog extends StatelessWidget {
//   final ErrorModel errorModel;
//   const MainErrorDialog({
//     required this.errorModel,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(CupertinoIcons.clear_circled_solid, color: Co.red, size: 35),
//             VerticalSpacing(20),
//             ListView.separated(
//               shrinkWrap: true,
//               itemCount: (errorModel.errors ?? []).length,
//               separatorBuilder: (context, index) => Padding(
//                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
//                 child: Divider(),
//               ),
//               itemBuilder: (context, index) {
//                 return Row(
//                   children: [
//                     Icon(CupertinoIcons.circle_fill, color: Co.lightGrey, size: 13),
//                     const HorizontalSpacing(10),
//                     Expanded(child: Text((errorModel.errors!)[index], style: TStyle.blackSemi(14))),
//                   ],
//                 );
//               },
//             ),
//             const VerticalSpacing(20),
//           ],
//         ),
//       ),
//     );
//   }
// }
