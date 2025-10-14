import 'package:flutter/material.dart';
import 'package:puppy_diary/ui/views/views.dart';
import 'package:puppy_diary/ui/widgets/components/app_drawer.dart';

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

      drawer: const AppDrawer(),

      body: views[currentIndex],
  );
}