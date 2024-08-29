import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soccer_app/models/fixlineups/fixture.dart';
import 'package:soccer_app/presentation/utils/assets_utlis.dart';

class CenterSideWIdget extends StatelessWidget {
  const CenterSideWIdget({
    super.key,
    required this.team, required this.fixture,
  });

  final Teams team;
  final Fixture fixture;

  @override
  Widget build(BuildContext context) {

     final dateMatch = DateFormat('d MMMM').format(fixture.date);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: FadeInImage(
                  placeholder: AssetImage(AssetImageApp.getLoadingGif),
                  image: NetworkImage(team.home.logo ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 70,
                child: Text(
                  team.home.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 120,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Text(
                  dateMatch,
                  maxLines: 2,
                  style: const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: const Text("VS", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
              ),
            ],
          ),
        ),
        SizedBox(
          width: 120,
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: FadeInImage(
                  placeholder: AssetImage(AssetImageApp.getLoadingGif),
                  image: NetworkImage(team.away.logo ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 70,
                child: Text(
                  team.away.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
