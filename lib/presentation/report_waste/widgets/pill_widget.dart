// import 'package:flutter/material.dart';
// import 'package:thuri_cycle/presentation/report_waste/widgets/animated_message_box.dart';

// //TODO: Add PillPage
// class PillWidget extends StatefulWidget with GetItStatefulWidgetMixin {
//   PillWidget({super.key});

//   @override
//   State<PillWidget> createState() => _PillWidgetState();
// }

// class _PillWidgetState extends State<PillWidget>
//     with
//         GetItStateMixin<PillWidget>,
//         SingleTickerProviderStateMixin<PillWidget> {
//   Pill? pill;
//   late final AnimationController pillAnim;

//   @override
//   void initState() {
//     super.initState();

//     pillAnim = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 500));

//     get<Backend>().loadRandomPill().then((value) {
//       setState(() {
//         pill = value;
//         pillAnim.forward();
//       });
//     }, onError: (_) {
//       // ignore errors when loading pills
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final mediaQuery = MediaQuery.of(context);

//     return Padding(
//       padding: EdgeInsets.only(
//         top: 8 + mediaQuery.padding.top,
//         right: 56 + mediaQuery.padding.right,
//         left: 56 + mediaQuery.padding.left,
//       ),
//       child: AnimatedMessageBox(
//         animation: pillAnim,
//         message: pill?.text ?? '',
//         containerColor: theme.colorScheme.secondaryContainer,
//         onContainerColor: theme.colorScheme.onSecondaryContainer,
//         maxLines: 3,
//         paddingTop: 0,
//         onTap: () {
//           // if (pill != null) {
//           //   pillAnim.reverse();
//           //   Navigator.pushNamed(context, PillPage.routeName, arguments: pill!);
//           // }
//         },
//       ),
//     );
//   }
// }
