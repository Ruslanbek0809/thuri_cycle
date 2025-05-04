import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:thuri_cycle/domain/auth/user_model/user_model.dart';
import 'package:thuri_cycle/l10n/l10n.dart';

@RoutePage()
class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage(this.mapCenter, {super.key});
  final LatLng mapCenter;

  @override
  State<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage>
    with SingleTickerProviderStateMixin<ScoreboardPage> {
  late TabController _tabController;
  List<UserModel>? _scoreboard;
  String? _customTitle;
  int _prevIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 5, vsync: this, initialIndex: _prevIndex);
    _onTabTap(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _customTitle == null || _tabController.index != 4
              ? context.l10n.scoreboard
              : _customTitle!,
        ),
        bottom: TabBar(
          controller: _tabController,
          onTap: _onTabTap,
          tabs: [
            Tab(text: context.l10n.global),
            Tab(text: context.l10n.km1),
            Tab(text: context.l10n.km10),
            Tab(text: context.l10n.km100),
            const Tab(icon: Icon(Icons.star)),
          ],
        ),
      ),
      body: _scoreboard == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          // if we are in the special tab, there is no custom title and the scoreboard is empty,
          // then it means that there is no active special scoreboard at the moment
          : (_scoreboard != null && _scoreboard!.isEmpty) &&
                  _tabController.index == 4 &&
                  _customTitle == null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      context.l10n.noActiveSpecialScoreboard,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  itemCount: _scoreboard?.length ?? 0,
                  itemBuilder: (context, index) {
                    final user = _scoreboard?[index];
                    if (user == null) {
                      // should be unreachable
                      return const SizedBox();
                    }

                    return InkWell(
                      onTap: () {},
                      // onTap: () =>
                      //     Navigator.pushNamed(context, UserPage.routeName, arguments: user.id),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            if (index == 0)
                              const Icon(
                                Icons.looks_one,
                                color: Color(0xffffd700),
                              )
                            else if (index == 1)
                              const Icon(
                                Icons.looks_two,
                                color: Color(0xffb0b0b0),
                              )
                            else if (index == 2)
                              const Icon(
                                Icons.looks_3,
                                color: Color(0xffcd7f32),
                              )
                            else
                              Container(
                                constraints: const BoxConstraints(minWidth: 24),
                                alignment: Alignment.center,
                                child: Text(
                                  (index + 1).toString(),
                                  textScaleFactor: 1.2,
                                ),
                              ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                user.username ?? '',
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Text(
                              context.l10n
                                  .points((user.points ?? 0).toDouble()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  void _onTabTap(int index) {
    if (index == _prevIndex && _scoreboard != null) {
      return;
    }
    _prevIndex = index;

    setState(() {
      _scoreboard = null;
    });

    _scoreboard = [
      const UserModel(
        uid: '1',
        username: 'Nadine Zimmer',
        points: 4631,
      ),
      const UserModel(
        uid: '2',
        username: 'Silke Eiffel',
        points: 3456,
      ),
      const UserModel(
        uid: '3',
        username: 'Jörg Dreher',
        points: 1450,
      ),
      const UserModel(
        uid: '4',
        username: 'Erik Dietrich',
        points: 1123,
      ),
      const UserModel(
        uid: '5',
        username: 'Dominik Reinhardt',
        points: 948,
      ),
      const UserModel(
        uid: '6',
        username: 'Sabrina Moench',
        points: 784,
      ),
      const UserModel(
        uid: '7',
        username: 'Thomas Eichmann',
        points: 549,
      ),
      const UserModel(
        uid: '8',
        username: 'Maria Pabst',
        points: 102,
      ),
      const UserModel(
        uid: '9',
        username: 'Ulrich Friedmann',
        points: 83,
      ),
      const UserModel(
        uid: '10',
        username: 'Robert Osterhagen',
        points: 43,
      ),
      const UserModel(
        uid: '11',
        username: 'Karolin Wurfel',
        points: 13,
      ),
      const UserModel(
        uid: '12',
        username: 'Kerstin Kaiser',
        points: 5,
      ),
    ];

    // _getScoreboardFuture(index).then((value) {
    //   setState(() {
    //     _customTitle = value.first;
    //     _scoreboard ??= value.second;
    //   });
    // }, onError: (e) {
    //   setState(() {
    //     _scoreboard ??= List.empty();
    //   });
    //   throw e;
    // });
  }

  // Future<Pair<String?, List<User>>> _getScoreboardFuture(int index) {
  //   final backend = getIt<Backend>();
  //   if (index == 0) {
  //     return backend.getGlobalScoreboard().map((e) => Pair(null, e));
  //   }
  //   if (index == 4) {
  //     return backend.getSpecialScoreboard();
  //   }

  //   double radius = index == 1
  //       ? 1000
  //       : index == 2
  //           ? 10000
  //           : 100000;
  //   return backend
  //       .getGeographicalScoreboard(
  //         widget.mapCenter.latitude,
  //         widget.mapCenter.longitude,
  //         radius,
  //       )
  //       .map((e) => Pair(null, e));
  // }
}
