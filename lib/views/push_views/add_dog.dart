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

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(2, (index) => TextField(
              onChanged: (text) => setState([
                    () => name = text,
                    () => fullName = text,
              ][index]),
              decoration: InputDecoration(
                label: Text(
                  ['Name', 'Full Name'][index],
                  style: context.texts.titleLarge,
                ),
              ),
            )),
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
            ElevatedButton(
                onPressed: () {
                  if (name == null) setState(() {
                    errorInfo = 'Name is required!';
                  });
                  else widget.onSave(name!, fullName ??= name!, selectedDate.value);
                },
                child: const Text('Save')
            ),
            Text(errorInfo, style: errorLabel),
          ].map((item) => Padding(
              padding: const EdgeInsets.all(20),
              child: item
          )).toList()
      )
  );
}
