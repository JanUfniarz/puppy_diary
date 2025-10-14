import 'package:flutter/material.dart';
import 'package:puppy_diary/types/data_types/widgets_data.dart';
import 'package:puppy_diary/ui/style/text_theme.dart';

mixin FormElements {

  List<Row> inputList(
      BuildContext context,
      List<InputData> data
  ) => List.generate(

      data.length, (index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            data[index].label,
            style: context.texts.titleLarge,
          ),

          data[index].child,
        ],
      )
  );

  List<TextField> textInputList(
      BuildContext context,
      List<TextFieldData> data
      ) => List.generate(

      data.length, (index) => TextField(
        onChanged: data[index].onChanged,

        decoration: InputDecoration(
          label: Text(
            data[index].label,
            style: context.texts.titleLarge,
          ),
        ),

      )
  );


  Column elementsArrangement(List<Widget> elements) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: elements.map((item) => Padding(
        padding: const EdgeInsets.all(20),
        child: item
    )).toList(),
  );
}

