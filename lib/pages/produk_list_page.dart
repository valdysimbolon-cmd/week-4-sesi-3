import 'package:flutter/material.dart';
import 'package:pam_w5s2_42325021/pages/produk_detail_page.dart';

class ProdukListPage extends StatelessWidget {
  ProdukListPage({super.key});

  final List<Map<String, dynamic>> produk = [
    {'nama': 'Kursi Minimalis', 'harga': 350000},
    {'nama': 'Meja Kerja Kayu', 'harga': 750000},
    {'nama': 'Lampu Meja LED', 'harga': 120000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: ListView.builder(
        itemCount: produk.length,
        itemBuilder: (context, index) {
          final item = produk[index];
          return ListTile(
            title: Text(item['nama']),
            subtitle: Text('Rp ${item['harga']}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final hasilPilihan = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProdukDetailPage(
                    namaProduk: item['nama'],
                    harga: item['harga'],
                  ),
                ),
              );

              if (hasilPilihan != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Anda memilih: $hasilPilihan')),
                );
              }
            },
          );
        },
      ),
    );
  }
}
