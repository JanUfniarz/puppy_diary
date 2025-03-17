import 'package:flutter/material.dart';
import 'package:puppy_diary/types/function_types.dart';
import 'package:puppy_diary/widgets/next_event_card.dart';

AppViewBuilder homeView = (context, controller, data) => ListView(
  children: <Widget>[

    const NextEventCard(
      icon: Icon(Icons.medical_services_outlined),
      label: 'Next wet visit',
      date: '08.04.2025',
    ),

    data == null ? const SizedBox() : const WeightCard(
      weight: 5.1,
    )

  ].map((el) => Padding(
    padding: const EdgeInsets.all(8),
    child: el,
  )).toList(),
);

class WeightCard extends StatelessWidget {
  final double weight;

  const WeightCard({super.key, required this.weight});

  @override
  Widget build(BuildContext context) => Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const SizedBox(),
        Text(
          '$weight kg'
        ),
      ],
    )
  );
}
