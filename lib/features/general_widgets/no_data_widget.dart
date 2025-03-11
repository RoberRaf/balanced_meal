// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:talbat_teme/config/localization/l10n/l10n.dart';
// import 'package:talbat_teme/config/theming/theming.dart';
// import 'package:talbat_teme/core/resources/assets.dart';
// import 'package:talbat_teme/features/general_widgets/spacing.dart';

// class NoDataWidget extends StatelessWidget {
//   const NoDataWidget({super.key, this.msg, this.color, this.svgImage, this.reload, this.imageSize});
//   final String? msg;
//   final Color? color;
//   final String? svgImage;
//   final double? imageSize;
//   final Future Function()? reload;
//   @override
//   Widget build(BuildContext context) {
//     // final size = MediaQuery.sizeOf(context);
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SvgPicture.asset(
//             svgImage ?? Assets.assetsSvgEmptyDrawer,
//             height: imageSize ?? 120,
//             fit: BoxFit.fitHeight,
//             colorFilter: const ColorFilter.mode(Co.grey, BlendMode.srcIn),
//           ),
//           VerticalSpacing(20),
//           Padding(
//             padding: AppConsts.defaultPadding,
//             child: Text(
//               msg ?? L10n.tr().noData,
//               style: TStyle.greyBold(18).copyWith(color: color),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           if (reload != null)
//             TextButton(
//               onPressed: reload,
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 spacing: 12,
//                 children: [
//                   Text(
//                     L10n.tr().reload,
//                     style: TStyle.greyBold(14).copyWith(color: Co.primary),
//                   ),
//                   Icon(
//                     Icons.refresh_rounded,
//                     color: Co.primary,
//                     size: 32,
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
