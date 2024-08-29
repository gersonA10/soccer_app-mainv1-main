import 'package:flutter/material.dart';
import 'package:soccer_app/models/fixlineups/fixture.dart';
import 'package:soccer_app/presentation/utils/assets_utlis.dart';

class RightSide extends StatelessWidget {

  final Teams team;
  const RightSide({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
               shape: BoxShape.circle
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage(AssetImageApp.getLoadingGif),
                image: NetworkImage(team.away.logo ?? 'https://st4.depositphotos.com/14953852/24787/v/380/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            child: Text(
              team.away.name,
              maxLines: 2,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}