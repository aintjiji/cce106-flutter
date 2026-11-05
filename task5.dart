import 'package:flutter/material.dart';

import 'app_shell.dart';

/// Task 5: MainAxisAlignment examples in a Row and in a Column.
/// No wrapper boxes: the Row / Column widgets are used directly,
/// and the screen itself is the space the alignment works inside.
class Task5Page extends StatelessWidget {
  const Task5Page({super.key});

  static const String _appBarTitle = 'Rojenne Paul Caras';

  // ---- Data ----
  static const List<MainAxisAlignment> _alignments = [
    MainAxisAlignment.center,
    MainAxisAlignment.spaceAround,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceEvenly,
    MainAxisAlignment.start,
    MainAxisAlignment.end,
  ];

  static const Map<String, Color> _letters = {
    ' A ': Colors.red,
    ' B ': Colors.blue,
    ' C ': Colors.green,
  };

  // ---- Reusable builders ----

  // The three colored letters used in every example.
  List<Widget> _buildLetters() {
    return _letters.entries
        .map(
          (e) => Text(
            e.key,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              backgroundColor: e.value,
            ),
          ),
        )
        .toList();
  }

  Widget _buildHeading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLabel(MainAxisAlignment value) {
    return Text(
      'MainAxisAlignment.${value.name}',
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    );
  }

  // One Row example: label on top, Row underneath.
  Widget _buildRowExample(MainAxisAlignment value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel(value),
          Row(
            mainAxisAlignment: value,
            children: _buildLetters(),
          ),
        ],
      ),
    );
  }

  // One Column example (it fills the height it is given, so the
  // alignment is visible).
  Widget _buildColumnExample(MainAxisAlignment value) {
    return Expanded(
      child: Column(
        mainAxisAlignment: value,
        children: _buildLetters(),
      ),
    );
  }

  // Small label above each Column example.
  Widget _buildColumnLabel(MainAxisAlignment value) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(value.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeading('Row'),
          Expanded(
            flex: 3,
            child: Column(children: _alignments.map(_buildRowExample).toList()),
          ),
          const Divider(),
          _buildHeading('Column'),
          Row(children: _alignments.map(_buildColumnLabel).toList()),
          Expanded(
            flex: 2,
            child: Row(children: _alignments.map(_buildColumnExample).toList()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(_appBarTitle),
      body: _buildBody(),
      bottomNavigationBar: const AppNavBar(selectedIndex: 2), // Task 5
    );
  }
} 