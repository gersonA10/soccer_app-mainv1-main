import 'package:flutter/material.dart';
import 'package:soccer_app/models/fixlineups/fixture.dart';
import 'package:soccer_app/presentation/utils/assets_utlis.dart';

class LeftSide extends StatelessWidget {
  final Teams team;

  const LeftSide({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(
              team.home.name,
              maxLines: 2,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ),
          const Spacer(),
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
                image: NetworkImage(team.home.logo ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
