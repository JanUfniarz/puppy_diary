import 'package:flutter/material.dart';
import 'package:puppy_diary/home_view.dart';
import 'package:puppy_diary/puppy_view.dart';

List<MainView> views = [
  const MainView(
      navItem: BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'home'
      ),
      view: HomeView()
  ),
  const MainView(
      navItem: BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: 'puppy'
      ),
      view: PuppyView()
  ),
];

class MainView extends StatelessWidget {
  final BottomNavigationBarItem navItem;
  final Widget _view;

  const MainView({
    required this.navItem,
    required Widget view,
    super.key
  }): _view = view;

  @override
  Widget build(BuildContext context) => _view;
}