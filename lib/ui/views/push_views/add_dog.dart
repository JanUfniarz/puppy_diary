import 'package:flutter/material.dart';
import 'package:puppy_diary/types/data_types/utility_types.dart';
import 'package:puppy_diary/ui/helpers/form.dart';
import 'package:puppy_diary/ui/style/text_theme.dart';
import 'package:puppy_diary/ui/views/views.dart';
import 'package:puppy_diary/ui/widgets/elements/date_picker.dart';


Future<AddDogVR?> pushAddDogView(
    BuildContext context) => pushView<AddDogVR>(
  context, (_) => _AddDogView()
);


class _AddDogView extends StatefulWidget {

  @override
  State<_AddDogView> createState() => _AddDogViewState();
}

class _AddDogViewState extends State<_AddDogView> with FormElements {
  String errorInfo = '';

  RestorableDateTime selectedDate = RestorableDateTime(DateTime.now());
  String? name;
  String? fullName;



  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Add New Dog')),
      body: elementsArrangement([

        ...textInputList(context, [
          (
            label: 'Name',
            onChanged: (text) => setState(() => name = text)
          ),
          (
            label: 'Full Name',
            onChanged: (text) => setState(() => fullName = text)
          ),
        ]),


        ...inputList(context, [
          (
            label: 'Birthday',
            child: DatePicker(selectedDate, scope: DatePickerScope.past),
          )
        ]),


        ElevatedButton(
            onPressed: () {
              if (name == null) setState(() => errorInfo = 'Name is required!');
              else Navigator.pop(context,
                  (
                    name: name!,
                    fullName: fullName ??= name!,
                    birthDate: selectedDate.value
                  )
              );
            },
            child: const Text('Save')
        ),


        Text(errorInfo, style: errorLabel),
      ])
  );
}
