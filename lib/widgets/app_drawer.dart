import 'package:flutter/material.dart';
import 'package:puppy_diary/controllers/app_controller.dart';
import 'package:puppy_diary/controllers/drawer_controller.dart';
import 'package:puppy_diary/style/decorations.dart';
import 'package:puppy_diary/style/icon_theme.dart';
import 'package:puppy_diary/style/text_theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  AppController get controller => AppController.instance;

  @override
  Widget build(BuildContext context) => Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [


        controller.drawerData.active.name != null ? UserAccountsDrawerHeader(
          accountName: Text(
            controller.drawerData.active.name!,
            style: darkLabel,
          ),
          accountEmail: Text(
            controller.drawerData.active.fullName ?? "",
            style: darkLabel,
          ),
        ) : const SizedBox(),


        ...controller.drawerData.rest.map((dog) => _ChangeDogButton(
          dog.name,
          onTap: () => controller.switchDog(dog.id),
        )),


        _AddDogButton(onTap: () => controller.addDog(context)),
      ],
    ),
  );
}




class _ChangeDogButton extends StatelessWidget {
  final void Function()? onTap;
  final String dogName;

  const _ChangeDogButton(this.dogName, {this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Container(
        height: 40,
        decoration: bottomLine,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(dogName, style: context.texts.bodyLarge,),
        )
    ),
  );
}




class _AddDogButton extends StatelessWidget {
  final void Function()? onTap;

  const _AddDogButton({this.onTap});

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
