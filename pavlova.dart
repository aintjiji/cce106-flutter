import 'package:flutter/material.dart';

import 'app_shell.dart';

class PavlovaPage extends StatelessWidget {
  const PavlovaPage({super.key});

  static const String _imageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtMmtc4188FEr2Ol4jTkeAPfFi02eRJQVk99p5Fxdx1A&s=10';
  static const String _appBarTitle = 'Rojenne Paul Caras';
  static const String _title = 'Mango Pavlova';
  static const String _description =
      'Pavlova is a meringue-based dessert named after the Russian ballerina '
      'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
      'topped with fruit and whipped cream.';
  static const int _rating = 3;
  static const int _reviewCount = 90;

  static const List<_InfoItem> _infoItems = [
    _InfoItem(icon: Icons.timer_outlined, label: 'PREP', value: '25 min'),
    _InfoItem(icon: Icons.restaurant, label: 'COOK', value: '1 gr'),
    _InfoItem(icon: Icons.people_outline, label: 'FEEDS', value: '4-6 hrs'),
  ];

  static const Color _accent = Color(0xFF4CAF50);
  static const Color _iconColor = Color(0xFFE5A100);

   Widget _buildImage() {
    return Image.network(
      _imageUrl,
      width: double.infinity,
      height: 320,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        height: 320,
        color: Colors.grey.shade300,
        child: const Icon(Icons.cake, size: 80, color: Colors.grey),
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      _title,
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildDescription() {
    return const Text(
      _description,
      style: TextStyle(fontSize: 15, height: 1.4),
    );
  }

  Widget _buildStars(int rating, {int total = 5}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        total,
        (i) => Icon(
          i < rating ? Icons.star : Icons.star_border,
          color: _iconColor,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildRatingRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStars(_rating),
        const SizedBox(width: 10),
        const Text(
          '$_reviewCount Reviews',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildInfoColumn(_InfoItem item) {
    return Column(
      children: [
        Icon(item.icon, color: _accent, size: 32),
        const SizedBox(height: 6),
        Text(
          item.label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(item.value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _infoItems.map(_buildInfoColumn).toList(),
    );
  }

  Widget _buildDetails() {
    const gap = SizedBox(height: 16);
    return Container(
      color: const Color(0xFFFDF4FB),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          gap,
          _buildDescription(),
          gap,
          _buildRatingRow(),
          gap,
          _buildInfoRow(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(_appBarTitle),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImage(),
            _buildDetails(),
          ],
        ),
      ),
      bottomNavigationBar: const AppNavBar(selectedIndex: 0), // Task 3
    );
  }
}

 class _InfoItem {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}