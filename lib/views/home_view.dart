import 'package:flutter/material.dart';
import 'package:puppy_diary/types/function_types.dart';
import 'package:puppy_diary/widgets/next_event_card.dart';

AppViewBuilder homeView = (context, controller, child) => ListView(
  children: <Widget>[

    const NextEventCard(
      icon: Icon(Icons.medical_services_outlined),
      label: 'Next wet visit',
      date: '08.04.2025',
    ),

    const WeightDiagramCard()

  ].map((el) => Padding(
    padding: const EdgeInsets.all(8),
    child: el,
  )).toList(),
);

class WeightDiagramCard extends StatelessWidget {
  const WeightDiagramCard({super.key});

  @override
  Widget build(BuildContext context) => const Card(
    child: Center(
      child: Text('wykres wagi'),
    )
  );
}
