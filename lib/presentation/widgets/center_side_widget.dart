import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:soccer_app/models/fixlineups/fixture.dart';

class CenterSide extends StatelessWidget {
  final Fixture fixture;

  const CenterSide({super.key, required this.fixture});

  @override
  Widget build(BuildContext context) {
    final dateMatch = DateFormat('d MMMM').format(fixture.date);
    return SizedBox(
      width: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '07:30',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          Text(
            dateMatch,
            style: const TextStyle(
                fontSize: 13, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              fixture.venue.name ?? '',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
