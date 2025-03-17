import 'package:flutter/material.dart';
import 'package:puppy_diary/views/main_views.dart';
import 'package:puppy_diary/style/default_theme.dart';

class PuppyDiary extends StatefulWidget {
  const PuppyDiary({super.key});

  @override
  State<PuppyDiary> createState() => _PuppyDiaryState();
}

class _PuppyDiaryState extends State<PuppyDiary> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.add),
                    ),
                    Text("Add Dog"),
                  ],
                )
              ),
              Container(child: Text("data")),
            ],
          ),
        ),
        
        body: views[currentIndex],
      ),
    );
  }
}