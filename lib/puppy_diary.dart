import 'package:flutter/material.dart';
import 'package:puppy_diary/style/default_theme.dart';
import 'package:puppy_diary/views/main_views.dart';
import 'package:puppy_diary/widgets/app_drawer.dart';

class PuppyDiary extends StatefulWidget {
  const PuppyDiary({super.key});

  @override
  State<PuppyDiary> createState() => _PuppyDiaryState();
}

class _PuppyDiaryState extends State<PuppyDiary> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: defaultTheme,
      home: Scaffold(

        bottomNavigationBar: BottomNavigationBar(
          items: views.map((el) => el.navItem).toList(),
          onTap: (index) => setState(() => currentIndex = index),
          currentIndex: currentIndex,
        ),

        appBar: AppBar(
          title: Text("Puppy Diary",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),

        drawer: const AppDrawer(
          addDog: ,
        ),

        body: views[currentIndex],
      ),
    );
}