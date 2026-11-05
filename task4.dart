import 'package:flutter/material.dart';

import 'app_shell.dart';

 class Task4Page extends StatelessWidget {
  const Task4Page({super.key});

  static const String _appBarTitle = 'Rojenne Paul Caras';
  static const double _spacing = 30;

   static const List<_InsetExample> _examples = [
    _InsetExample(
      label: 'EdgeInsets.all(30)',
      padding: EdgeInsets.all(30),
      color: Colors.red,
      textColor: Colors.black,
    ),
    _InsetExample(
      label: 'EdgeInsets.symmetric(horizontal: 40, vertical: 10)',
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      color: Colors.yellow,
      textColor: Colors.black,
    ),
    _InsetExample(
      label: 'EdgeInsets.only(left: 30, top: 10, right: 5, bottom: 20)',
      padding: EdgeInsets.only(left: 30, top: 10, right: 5, bottom: 20),
      color: Colors.blue,
      textColor: Colors.white,
    ),
    _InsetExample(
      label: 'EdgeInsets.fromLTRB(10, 20, 30, 40)',
      padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
      color: Colors.green,
      textColor: Colors.white,
    ),
  ];

   Widget _buildBox(_InsetExample example) {
    return Container(
      padding: example.padding,
      color: example.color,
      child: Text(
        example.label,
        style: TextStyle(color: example.textColor, fontSize: 16),
      ),
    );
  }

  Widget _buildBody() {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 12),
      itemCount: _examples.length,
      separatorBuilder: (_, __) => const SizedBox(height: _spacing),
      itemBuilder: (_, i) => Center(child: _buildBox(_examples[i])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(_appBarTitle),
      body: _buildBody(),
      bottomNavigationBar: const AppNavBar(selectedIndex: 1), // Task 4
    );
  }
}

 class _InsetExample {
  final String label;
  final EdgeInsets padding;
  final Color color;
  final Color textColor;

  const _InsetExample({
    required this.label,
    required this.padding,
    required this.color,
    required this.textColor,
  });
}