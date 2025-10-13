import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puppy_diary/logic/controllers/app_controller.dart';
import 'package:puppy_diary/database/individual_repository.dart';
import 'package:puppy_diary/ui/puppy_diary.dart';
import 'package:puppy_diary/ui/style/default_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppController.initiate(
      IndividualRepository()
  );

  runApp(ChangeNotifierProvider<AppController>(
    create: (_) => AppController.instance,
    child: MaterialApp(
      theme: defaultTheme,
      home: const PuppyDiary(),
    )
  ));
}