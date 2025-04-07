import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:thuri_cycle/l10n/l10n.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // final theme = Theme.of(context);
    // final count = context.select((CounterCubit cubit) => cubit.state);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.homeAppBarTitle)),
      body: Center(child: Container()),
    );
  }
}
