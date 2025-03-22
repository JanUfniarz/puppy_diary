import 'package:flutter/material.dart';
import 'package:puppy_diary/controllers/app_controller.dart';
import 'package:puppy_diary/controllers/drawer_controller.dart';
import 'package:puppy_diary/style/default_theme.dart';
import 'package:puppy_diary/style/icon_theme.dart';
import 'package:puppy_diary/style/palette.dart';
import 'package:puppy_diary/style/text_theme.dart';

class AppDrawer extends StatelessWidget {
  final void Function(int id) changeDog;
  final void Function() addDog;

  const AppDrawer({super.key, required this.changeDog, required this.addDog});

  DrawerData get data => AppController.instance.drawerData;

  @override
  Widget build(BuildContext context) => Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        data.active.name != null ? UserAccountsDrawerHeader(
          accountName: Text(data.active.name!),
          accountEmail: Text(data.active.fullName ?? ""),
          decoration: defaultUADHTheme,
        ) : const SizedBox(),

        ...data.rest.map((dog) => _ChangeDogButton(
          dog.name,
          onTap: () => changeDog(dog.id),
        )),

        _AddDogButton(onTap: addDog),
      ],
    ),
  );
}

class _ChangeDogButton extends StatelessWidget {
  final void Function()? onTap;
  final String dogName;

  const _ChangeDogButton(this.dogName, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Container(
        height: 40,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(
              width: 2,
              color: palette[Col.primary]!
            ))
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(dogName, style: context.texts.bodyLarge,),
        )
    ),
  );
}


class _AddDogButton extends StatelessWidget {
  final void Function()? onTap;

  const _AddDogButton({this.onTap, super.key});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Theme(
                data: ThemeData(iconTheme: mainIcon),
                child: const Icon(Icons.add,)
            ),
          ),
          Text("Add Dog",
            style: context.texts.titleMedium,
          ),
        ],
      )
    ),
  );
}
