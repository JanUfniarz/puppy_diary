import 'package:flutter/material.dart';
import 'package:puppy_diary/style/icon_theme.dart';

class NextEventCard extends StatelessWidget {
  final Icon icon;
  final String label;
  final String date;

  const NextEventCard({
    required this.icon,
    required this.label,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Theme(
                data: ThemeData(iconTheme: mainIcon),
                child: icon
            ),
            Text('$label:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(date,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
}