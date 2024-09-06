import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:soccer_app/models/fixlineups/fixture.dart';
import 'package:soccer_app/models/fixlineups/lineups_model.dart';
import 'package:soccer_app/presentation/providers/fixture/fixture_provider.dart';
import 'package:soccer_app/presentation/utils/assets_utlis.dart';
import 'package:soccer_app/presentation/widgets/details_match_widgets/custom_app_bar_widget.dart';
import 'package:soccer_app/presentation/widgets/line_up_widget.dart';

class DetailsMatchScreen extends StatefulWidget {
  final Teams team;
  final Fixture fixture;
  const DetailsMatchScreen(
      {super.key, required this.team, required this.fixture});

  @override
  State<DetailsMatchScreen> createState() => _DetailsMatchScreenState();
}

class _DetailsMatchScreenState extends State<DetailsMatchScreen> {


  late Future<List<ResponseLine>> _futureLineups;

  @override
  void initState() {
    super.initState();
    _futureLineups = FixtureProvider().getAllLineups(widget.fixture.id);

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 38, 37, 37),
        body: FutureBuilder(
          future: _futureLineups,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator(),);

          
            final lineups = snapshot.data ?? [];
            return SingleChildScrollView(
              child: Column(
              children: [
                CustomAppBar(
                  size: size,
                  team: widget.team,
                  fixture: widget.fixture,
                ),
                lineups.isEmpty ? Container() : Container(
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
                  SizedBox(
                  height: 1000,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      lineups.isEmpty
                      ? Column(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: Lottie.asset(AssetImageApp.noData),
                          ),
                          const Text('La informacion aun no han sido cargada, intenta mas tarde', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18),),
                        ],
                      )
                      :  LinueUpHome(lineupsResponse: snapshot.data,),
                      lineups.isEmpty
                      ? Column(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: Lottie.asset(AssetImageApp.noData),
                          ),
                          const Text('Las Estadisticas aun no han sido cargadas, intenta mas tarde', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18),),
                        ],
                      )
                      :  LinueUpHome(lineupsResponse: snapshot.data,),
                      // LineupsWidget(lineUps: snapshot.data!,),
                    ],
                  ),
                )
              ],
            ),
            );
          },
         
        ),
      ),
    );
  }
}