import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pavlok_challenge/UI/pavlok_theme.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/leaf_icon.dart';
import '../widgets/pav_button.dart';
import 'sleep_onboarding.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int current = 1;
  int total = 4;

  late TabController _tabController;
  int selectedTab = 0;
  int _tileIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    // _tabController.addListener(_handleSelection);
  }

  // _handleSelection() {
  //   setState(() {
  //     selectedTab = _tabController.index;
  //   });
  // }

  _tileSelection(int value) {
    setState(() {
      _tileIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(300),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 80.0,
                    ),
                    Expanded(
                      child: StepProgressIndicator(
                        totalSteps: total,
                        currentStep: current,
                        customStep: (index, color, _) => color ==
                                const Color(0XFFFFB706)
                            ? Container(
                                height: 8,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(10.0),
                                  ),
                                ),
                              )
                            : Container(
                                height: 8,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                        size: 8,
                        padding: 0,
                        selectedColor: const Color(0XFFFFB706),
                        unselectedColor: const Color(0xffE5E6EC),
                        roundedEdges: const Radius.circular(20),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      '$current of $total',
                      style: PavlokTheme.lightTextTheme.headline6
                          ?.copyWith(color: Colors.black54),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 20.0, right: 20, bottom: 20),
                  child: Text(
                    'What\'s your main goal?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, left: 20.0, right: 20, bottom: 20),
                  child: Text(
                    'Let\'s start with one of these habits',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                      labelColor: const Color(0xFF8338EC),
                      unselectedLabelColor: Colors.black45,
                      indicator: const UnderlineTabIndicator(
                        insets: EdgeInsets.only(left: 18, right: 35),
                        borderSide:
                            BorderSide(width: 3.0, color: Color(0xFF8338EC)),
                      ),
                      tabs: [
                        Tab(
                          child: Row(
                            children: const [
                              Icon(
                                LeafIcon.leaf,
                                size: 12,
                              ),
                              Text(' Start a good habit'),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: const [
                              Icon(
                                Icons.offline_bolt_outlined,
                                size: 18,
                              ),
                              Text(' Break a bad habit'),
                            ],
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: PavButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SleepOnboarding()));
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 24),
          child: TabBarView(
              //controller: _tabController,
              children: [_habitList(), _breakHabitList()]),
        ),
      ),
    );
  }

  Widget _breakHabitList() => ListView(
        children: [
          _habitTile(
              text: 'Can\'t wakeup',
              imageFile: 'assets/action_icons/clock.png',
              tileValue: 0),
          _habitTile(
              text: 'Getting lazy for workout',
              imageFile: 'assets/action_icons/walk.png',
              tileValue: 1),
          _habitTile(
              text: 'Forgetting to drink water',
              imageFile: 'assets/action_icons/bottle.png',
              tileValue: 2),
          _habitTile(
              text: 'Spending on credit cards',
              imageFile: 'assets/action_icons/donate.png',
              tileValue: 3)
        ],
      );
  Widget _habitList() => ListView(
        children: [
          _habitTile(
              text: 'Set bedtime and wakeup',
              imageFile: 'assets/action_icons/clock.png',
              tileValue: 0),
          _habitTile(
              text: 'Take a walk',
              imageFile: 'assets/action_icons/walk.png',
              tileValue: 1),
          _habitTile(
              text: 'Stay hydrated',
              imageFile: 'assets/action_icons/bottle.png',
              tileValue: 2),
          _habitTile(
              text: 'Call parents',
              imageFile: 'assets/action_icons/call.png',
              tileValue: 3),
          _habitTile(
              text: 'Donate to charity',
              imageFile: 'assets/action_icons/donate.png',
              tileValue: 4)
        ],
      );

  Widget _habitTile(
          {required String imageFile,
          required String text,
          required int tileValue}) =>
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              _tileSelection(tileValue);
            });
          },
          child: Container(
            height: 72,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 2, 2, 2),
              child: Row(
                children: [
                  Container(
                      width: 66,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xffE5E5E5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Image(
                          width: 40,
                          height: 40,
                          image: AssetImage(imageFile),
                        ),
                      )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    text,
                    style: PavlokTheme.lightTextTheme.headline5?.copyWith(
                        color: _tileIndex == tileValue
                            ? const Color(0xFF8338EC)
                            : const Color(0xff383E53)),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 2.0,
                    color: _tileIndex == tileValue
                        ? const Color(0xFF8338EC)
                        : Colors.transparent),
                boxShadow: const [
                  BoxShadow(
                      spreadRadius: 2,
                      color: Color(0xffE5E5E5),
                      blurRadius: 8,
                      offset: Offset(0, 1))
                ]),
          ),
        ),
      );
}
