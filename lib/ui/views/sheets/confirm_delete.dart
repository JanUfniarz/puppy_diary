import 'package:flutter/material.dart';
import 'package:puppy_diary/ui/widgets/buttons/delete_button.dart';
import 'package:puppy_diary/ui/views/sheets/bottom_sheet.dart';

Future<bool?> confirmDeleteSheet(BuildContext context) => bottomSheet<bool>(
    context,
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Are you sure you want to delete this item?',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context, false),
                  label: const Text('cancel'),
                  icon: const Icon(Icons.close)
              ),

              DeleteButton(onPressed: () => Navigator.pop(context, true))
            ],
          ),
        ],
      ),
    )
);