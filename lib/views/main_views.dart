import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puppy_diary/controllers/app_controller.dart';
import 'package:puppy_diary/types/function_types.dart';
import 'package:puppy_diary/views/home_view.dart';
import 'package:puppy_diary/views/puppy_view.dart';

List<MainView> views = [
  MainView(
    navItem: const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'home'
    ),
    view: homeView
  ),
  MainView(
    navItem: const BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: 'puppy'
    ),
    view: puppyView
  ),
];

class MainView extends StatelessWidget {
  final BottomNavigationBarItem navItem;
  final AppViewBuilder _viewBuilder;

  const MainView({
    required this.navItem,
    required AppViewBuilder view,
    super.key
  }): _viewBuilder = view;

  @override
  Widget build(BuildContext context) => Consumer<AppController>(
      builder: (context, controller, _) => _viewBuilder(
          context, controller, controller.dog
      ),
  );
}