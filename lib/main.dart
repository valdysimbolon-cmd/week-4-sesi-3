import 'package:flutter/material.dart';
import 'package:pam_w5s2_42325021/pages/katalog_main_page.dart';
import 'package:pam_w5s2_42325021/pages/main_navigation_page.dart';
import 'package:pam_w5s2_42325021/pages/produk_list_page.dart';
import 'package:pam_w5s2_42325021/widget_basic/counter_widget.dart';
import 'package:pam_w5s2_42325021/widget_basic/dialog_widget.dart';
import 'package:pam_w5s2_42325021/widget_basic/form_widget.dart';
import 'package:pam_w5s2_42325021/widget_basic/textfield_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget UI - PAM W4S3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainMenuWrapper(),
    );
  }
}

class MainMenuWrapper extends StatelessWidget {
  const MainMenuWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Widget UI Part 2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Pengembangan Aplikasi Mobile',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('Studi Kasus: Katalog Produk'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Latihan Modul',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text('1. Counter Widget'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CounterWidget()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('2. TextField Widget'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TextFieldWidget()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('3. Form & Validasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormWidget()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('4. Navigasi & Detail Produk'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProdukListPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.warning_amber),
              title: const Text('5. Dialog & SnackBar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DialogWidget()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.tab),
              title: const Text('6. Bottom Navigation'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainNavigationPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: const KatalogMainPage(),
    );
  }
}
