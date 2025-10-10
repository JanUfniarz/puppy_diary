import 'package:flutter/material.dart';
import 'package:puppy_diary/style/text_theme.dart';
import 'package:puppy_diary/widgets/date_picker.dart';

class AddDogView extends StatefulWidget {
  final Null Function(String name, String fullName, DateTime birthDate) onSave;

  const AddDogView({super.key, required this.onSave});

  @override
  State<AddDogView> createState() => _AddDogViewState();
}

class _AddDogViewState extends State<AddDogView> {
  String errorInfo = '';

  RestorableDateTime selectedDate = RestorableDateTime(DateTime.now());
  String? name;
  String? fullName;



  late final List<({String label, void Function(String) onChanged})> _textFieldsData = [
    (
      label: 'Name',
      onChanged: (text) => setState(() => name = text)
    ),
    (
      label: 'Full Name',
      onChanged: (text) => setState(() => fullName = text)
    ),
  ];



  Column _elementsArrangement(List<Widget> elements) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: elements.map((item) => Padding(
        padding: const EdgeInsets.all(20),
        child: item
    )).toList(),
  );



  @override
  Widget build(BuildContext context) => Scaffold(
      body: _elementsArrangement([

        // TextFields
        ...List.generate(_textFieldsData.length, (index) => TextField(
          onChanged: _textFieldsData[index].onChanged,
          decoration: InputDecoration(
            label: Text(
              _textFieldsData[index].label,
              style: context.texts.titleLarge,
            ),
          ),
        )),


        // DatePicker
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Birthday',
              style: context.texts.titleLarge,
            ),
            DatePicker(selectedDate),
          ],
        ),


        // Save Button
        ElevatedButton(
            onPressed: () {
              if (name == null) setState(() => errorInfo = 'Name is required!');
              else widget.onSave(name!, fullName ??= name!, selectedDate.value);
            },
            child: const Text('Save')
        ),


        Text(errorInfo, style: errorLabel),
      ])
  );
}
