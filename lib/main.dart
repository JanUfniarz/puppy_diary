import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puppy_diary/controllers/app_controller.dart';
import 'package:puppy_diary/database/individual_repository.dart';
import 'package:puppy_diary/helpers/main_transformer.dart';
import 'package:puppy_diary/puppy_diary.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppController.initiate(
      mainTransformer,
      IndividualRepository()
  );

  runApp(ChangeNotifierProvider<AppController>(
    create: (_) => AppController.instance,
    child: const PuppyDiary()
  ));
}