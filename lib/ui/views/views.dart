import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puppy_diary/logic/controllers/app_controller.dart';
import 'package:puppy_diary/types/function_types.dart';
import 'package:puppy_diary/ui/views/main_views/home.dart';
import 'package:puppy_diary/ui/views/main_views/puppy.dart';

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
      builder: (context, controller, _) => _viewBuilder(context, controller),
  );
}

Future<T?> pushView<T>(
    BuildContext context,
    WidgetBuilder view,
    ) => Navigator.push<T?>(
  context,
  MaterialPageRoute(
    builder: view,
  ),
);