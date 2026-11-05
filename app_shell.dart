import 'package:flutter/material.dart';


const Color kAppBarColor = Color(0xFF99CC00);

class AppRoutes {
  static const String task3 = '/';
  static const String task4 = '/task4';
  static const String task5 = '/task5';
}

PreferredSizeWidget buildAppBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: kAppBarColor,
    foregroundColor: Colors.white,
  );
}

class _TaskTab {
  final String label;
  final String? route;

  const _TaskTab(this.label, this.route);
}

class AppNavBar extends StatelessWidget {
  final int selectedIndex;

  const AppNavBar({super.key, required this.selectedIndex});

  static const List<_TaskTab> _tabs = [
    _TaskTab('Task 3', AppRoutes.task3),
    _TaskTab('Task 4', AppRoutes.task4),
    _TaskTab('Task 5', AppRoutes.task5),
    _TaskTab('Task 6', null), // not built yet
  ];

  NavigationDestination _buildDestination(_TaskTab tab) {
    return NavigationDestination(
      icon: const Icon(Icons.unfold_more_outlined),
      selectedIcon: const Icon(Icons.unfold_more_outlined),
      label: tab.label,
    );
  }

  void _handleTap(BuildContext context, int index) {
    if (index == selectedIndex) return; // already on this page

    final tab = _tabs[index];
    if (tab.route != null) {
      Navigator.pushReplacementNamed(context, tab.route!);
      return;
    }

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('${tab.label} is coming soon')));
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) => _handleTap(context, index),
      destinations: _tabs.map(_buildDestination).toList(),
    );
  }
}