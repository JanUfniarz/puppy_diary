import 'package:flutter/material.dart';
import 'package:puppy_diary/controllers/app_controller.dart';
import 'package:puppy_diary/functions/add_dog.dart';
import 'package:puppy_diary/views/main.dart';
import 'package:puppy_diary/widgets/app_drawer.dart';

class PuppyDiary extends StatefulWidget {
  const PuppyDiary({super.key});

  @override
  State<PuppyDiary> createState() => _PuppyDiaryState();
}

class _PuppyDiaryState extends State<PuppyDiary> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: views.map((el) => el.navItem).toList(),
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
      ),

      appBar: AppBar(
        title: const Text("Puppy Diary"),
      ),

      drawer: AppDrawer(
        changeDog: (id) => AppController.instance.switchDog(id),
        addDog: () => newDog(context)
            .then((dog) => AppController.instance.addDog(dog)),
      ),

      body: views[currentIndex],
  );
}