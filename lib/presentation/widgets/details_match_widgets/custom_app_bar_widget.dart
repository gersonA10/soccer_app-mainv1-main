
import 'package:flutter/material.dart';
import 'package:soccer_app/models/fixlineups/fixture.dart';
import 'package:soccer_app/presentation/widgets/details_match_widgets/center_side_detail_widget.dart';
import 'package:soccer_app/presentation/widgets/details_match_widgets/up_side_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.size,
    required this.team,
    required this.fixture,
  });

  final Size size;
  final Teams team;
  final Fixture fixture;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.3,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [
              0.2,
              1.0,
            ],
            colors: [
              Colors.blue,
              Color.fromARGB(255, 163, 193, 98),
            ],
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.06,
          ),
          //*Parte de arriba
          UpSide(size: size),
          //*Parte del centro
          CenterSideWIdget(team: team, fixture: fixture,),
        ],
      ),
    );
  }
}
