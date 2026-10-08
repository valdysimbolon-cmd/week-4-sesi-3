import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.person,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Praktikan PAM',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Pengembangan Aplikasi Mobile - W4S3',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.badge),
              title: Text('Mata Kuliah'),
              subtitle: Text('Pengembangan Aplikasi Mobile (PAM)'),
            ),
            const ListTile(
              leading: Icon(Icons.widgets),
              title: Text('Materi'),
              subtitle: Text('Widget UI Part 2 - Interaktivitas, Form, Navigasi'),
            ),
            const ListTile(
              leading: Icon(Icons.school),
              title: Text('Status Praktikum'),
              subtitle: Text('Tugas Selesai Sesuai Modul'),
            ),
          ],
        ),
      ),
    );
  }
}
