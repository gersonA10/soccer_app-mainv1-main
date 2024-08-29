import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:soccer_app/models/fixlineups/lineups_model.dart';
import 'package:soccer_app/presentation/providers/fixture/fixture_provider.dart';
import 'package:soccer_app/presentation/utils/assets_utlis.dart';
import 'package:soccer_app/presentation/widgets/details_match_widgets/custom_app_bar_widget.dart';
import 'package:soccer_app/presentation/widgets/line_up_widget.dart';

class TestScreen extends StatefulWidget {
  static const path = '/test_screen';
  static const name = 'test_screen';
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late Future<List<ResponseLine>> _futureLineups;

  @override
  void initState() {
    super.initState();
    // _futureLineups = FixtureProvider().getAllLineups(widget.fixture.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 38, 37, 37),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // CustomAppBar(
                //   size: size,
                //   team: ''
                //   fixture: widget.fixture,
                // ),
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.amber,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 40,
                  width: 220,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white)),
                    physics: const NeverScrollableScrollPhysics(),
                    labelColor: Colors.white,
                    dividerColor: Colors.transparent,
                    splashBorderRadius: BorderRadius.circular(20),
                    indicatorColor: Colors.amber,
                    tabs: const [
                      Tab(
                        text: 'Lineups',
                      ),
                      Tab(
                        text: 'Statistics',
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 1000,
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      // Column(
                      //   children: [
                      //     SizedBox(
                      //       width: 200,
                      //       height: 200,
                      //       child: Lottie.asset(AssetImageApp.noData),
                      //     ),
                      //     const Text('La informacion aun no han sido cargada, intenta mas tarde', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18),),
                      //   ],
                      // )
                      LineupsWidget(
                        lineUps: [],
                      ),
                      LineupsWidget(
                        lineUps: [],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class LineupsWidget extends StatelessWidget {
  final List lineUps;

  const LineupsWidget({super.key, required this.lineUps});

  @override
  Widget build(BuildContext context) {
    return LinueUpHome();
  }
}



