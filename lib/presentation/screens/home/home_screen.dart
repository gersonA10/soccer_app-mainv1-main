import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:soccer_app/models/fixlineups/fixture.dart';
import 'package:soccer_app/presentation/providers/fixture/fixture_provider.dart';
import 'package:soccer_app/presentation/screens/home/details_match/details_match.dart';
import 'package:soccer_app/presentation/screens/ligues/ligues_sceen.dart';
import 'package:soccer_app/presentation/screens/test_screen.dart';
import 'package:soccer_app/presentation/widgets/center_side_widget.dart';
import 'package:soccer_app/presentation/widgets/left_side_widget.dart';
import 'package:soccer_app/presentation/widgets/right_side_widget.dart';

class HomeScreen extends StatefulWidget {
  static const path = '/home';
  static const name = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late ValueNotifier<DateTime> selectedDateNotifier;
  late Future<List<ResponseFixt>> _future;



  @override
  void initState() {
    super.initState();
    selectedDateNotifier = ValueNotifier<DateTime>(DateTime.now());
    _fetchData();

    selectedDateNotifier.addListener((){
      _fetchData();
    });
  }

  Future<void> _fetchData()async{
    _future = FixtureProvider().fecthDataFixture(selectedDateNotifier.value);
  }

  Future<void> _selectedDate(BuildContext context) async {

    final DateTime? datePicked = await showDatePicker(
                context: context, 
                firstDate: DateTime.utc(2010, 8, 12), 
                lastDate: DateTime.utc(2030, 3, 12),
                cancelText: 'Cancelar',
                barrierDismissible: false,
                
              );
    if (datePicked != null && datePicked != selectedDateNotifier.value) {
      // FixtureProvider().fecthDataFixture(selectedDate);
      setState(() {
        selectedDateNotifier.value = datePicked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double letterSize = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.lightBlue.withOpacity(0.5), 
        actions: [
          IconButton(
            onPressed: () {
              //Esto definira la fecha de el fixture que se mostrara
              _selectedDate(context);

            }, 
            icon: const Icon(Icons.calendar_month_rounded, color: Colors.white,),
          ),
          TextButton(
            onPressed: () => context.push(LiguesScreen.path),
            child: Text("Leagues",style:  TextStyle(fontSize: letterSize * 0.025, fontWeight: FontWeight.bold,color: Colors.white),),
          ),
        ],
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: _future,
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(),);
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {

                  final team = snapshot.data![index].teams;
                  final fixture = snapshot.data![index].fixture;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) =>  DetailsMatchScreen(team: team, fixture: fixture,),),
                      );
                    },
                    child: Container(
                      height: 110,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            //* Lado Izquierdo
                            LeftSide(team: team,),
                            //* Centro
                            CenterSide(fixture: fixture,),
                            //* Lado Derecho
                            RightSide(team: team,)
                            ],
                            
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          ),
        ],
      ),
    );
  }
}



