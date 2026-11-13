import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFFFFF)),
      ),
      home: const StudentDashboard(),
    );
  }
}

class Subject {
  final String name;
  final String instructor;
  final String schedule;
  const Subject(this.name, this.instructor, this.schedule);
}

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  static const List<Subject> subjects = [
    Subject('Juan', 'Mr.Smith', 'Mon & Wed 10:0011:30am'),
    Subject('Database Systems', 'Mrs.Garcia', 'Tue & Thu 1:002:30pm'),
    Subject('Operating Systems', 'Dr.Lee', 'Fri 8:00-11:00am'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('Student Dashbard', style: TextStyle(fontSize: 22)),
        actions: [
          IconButton(
            icon: const Icon(Icons.keyboard_double_arrow_right, size: 35),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 35),
            _buildContactCard(),
            const SizedBox(height: 32),
            const Text(
              'Subjects',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 30),
            ...subjects.map(_buildSubjectCard),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          child: ClipOval(
            child: Image.network(
              'assets/person1.jpg',
              width: 100,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.person, size: 48, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 35),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rojenne Paul Caras',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 35),
            Text('ID: 529858', style: TextStyle(fontSize: 14)),
            Text('BSIT 3rd Year', style: TextStyle(fontSize: 14)),
          ],
        ),
      ],
    );
  }

  Widget _buildContactCard() {
    return Card(
      elevation: 4,
      color: const Color(0xFFFFFFF4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            _InfoRow(icon: Icons.mark_email_unread, text: 'arjay@admin.com'),
            SizedBox(height: 28),
            _InfoRow(icon: Icons.sms, text: '+63 999-500-2113'),
            SizedBox(height: 23),
            _InfoRow(
              icon: Icons.cottage,
              text: 'Bangkal, Davao Del Sur, Davao City, Philippines',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectCard(Subject s) {
    return Card(
      elevation: 2,
      color: const Color(0xFFFFFFFF),
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(s.name, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Text(
                'Instructor: ${s.instructor}',
                style: const TextStyle(fontSize: 13, color: Color.fromARGB(221, 36, 35, 35)),
              ),
              Text(
                'Schedule: ${s.schedule}',
                style: const TextStyle(fontSize: 13, color: Color.fromARGB(221, 36, 35, 35)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color.fromARGB(255, 170, 170, 170)),
        const SizedBox(width: 20),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    );
  }
}
