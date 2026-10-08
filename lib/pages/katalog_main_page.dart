import 'package:flutter/material.dart';
import 'package:pam_w5s2_42325021/pages/produk_detail_page.dart';
import 'package:pam_w5s2_42325021/pages/profile_page.dart';
import 'package:pam_w5s2_42325021/pages/tambah_produk_page.dart';
import 'package:pam_w5s2_42325021/widget_basic/product_card.dart';

class KatalogMainPage extends StatefulWidget {
  const KatalogMainPage({super.key});

  @override
  State<KatalogMainPage> createState() => _KatalogMainPageState();
}

class _KatalogMainPageState extends State<KatalogMainPage> {
  int _tabTerpilih = 0;
  int _jumlahKeranjang = 0;

  final List<Map<String, dynamic>> _daftarProduk = [
    {
      'nama': 'Kursi Minimalis',
      'harga': 350000,
      'icon': Icons.chair,
      'deskripsi': 'Kursi kayu minimalis cocok untuk ruang tamu dan kamar.'
    },
    {
      'nama': 'Meja Kerja Kayu',
      'harga': 750000,
      'icon': Icons.table_restaurant,
      'deskripsi': 'Meja kerja kokoh dari kayu jati dengan desain modern.'
    },
    {
      'nama': 'Lampu Meja LED',
      'harga': 120000,
      'icon': Icons.light,
      'deskripsi': 'Lampu baca LED hemat energi dengan 3 tingkat pencahayaan.'
    },
    {
      'nama': 'Rak Buku Kayu',
      'harga': 450000,
      'icon': Icons.shelves,
      'deskripsi': 'Rak buku 4 tingkat serbaguna untuk merapikan ruangan.'
    },
    {
      'nama': 'Headset Wireless',
      'harga': 250000,
      'icon': Icons.headphones,
      'deskripsi': 'Headset bluetooth dengan kualitas suara jernih dan bass mantap.'
    },
  ];

  void _tambahKeKeranjang() {
    setState(() {
      _jumlahKeranjang++;
    });
  }

  void _tambahProdukBaru() async {
    final hasil = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (context) => const TambahProdukPage(),
      ),
    );

    if (!mounted) return;
    if (hasil != null) {
      setState(() {
        _daftarProduk.add(hasil);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Produk "${hasil['nama']}" berhasil ditambahkan!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _bukaDetailProduk(Map<String, dynamic> item) async {
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProdukDetailPage(
          namaProduk: item['nama'],
          harga: item['harga'],
          icon: item['icon'] as IconData?,
          deskripsi: item['deskripsi'],
        ),
      ),
    );

    if (!mounted) return;
    if (hasil != null) {
      _tambahKeKeranjang();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '1x "$hasil" telah ditambahkan ke keranjang!',
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _konfirmasiHapusProduk(int index) {
    final produk = _daftarProduk[index];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Hapus Produk?'),
          content: Text(
            'Apakah Anda yakin ingin menghapus "${produk['nama']}" dari katalog?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _daftarProduk.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Produk "${produk['nama']}" telah dihapus'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: const Text('Hapus', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCatalogTab() {
    return Scaffold(
      body: _daftarProduk.isEmpty
          ? const Center(
              child: Text(
                'Belum ada produk.\nTekan tombol + untuk menambahkan produk.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: _daftarProduk.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = _daftarProduk[index];
                return ProductCard(
                  nama: item['nama'],
                  harga: item['harga'],
                  icon: item['icon'] as IconData?,
                  onDelete: () => _konfirmasiHapusProduk(index),
                  onTap: () => _bukaDetailProduk(item),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambahProdukBaru,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Produk'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildCatalogTab(),
      const ProfilePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_tabTerpilih == 0 ? 'Katalog Produk' : 'Profil Praktikan'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                tooltip: 'Keranjang Belanja',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Keranjang belanja berisi $_jumlahKeranjang item.',
                      ),
                    ),
                  );
                },
              ),
              if (_jumlahKeranjang > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      '$_jumlahKeranjang',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: pages[_tabTerpilih],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabTerpilih,
        onTap: (index) {
          setState(() {
            _tabTerpilih = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Katalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
