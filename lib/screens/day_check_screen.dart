import 'package:flutter/material.dart';

class DayCheckScreen extends StatefulWidget {
  const DayCheckScreen({super.key});

  @override
  State<DayCheckScreen> createState() => _DayCheckScreenState();
}

class _DayCheckScreenState extends State<DayCheckScreen> {
  final _numberController = TextEditingController();
  String _namaHari = 'Hasil akan tampil di sini';

  // REVISI: Menambahkan dispose untuk membersihkan controller
  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  void _cekHari() {
    final int nomor = int.tryParse(_numberController.text) ?? 0;
    const Map<int, String> hariMap = {
      1: 'Senin',
      2: 'Selasa',
      3: 'Rabu',
      4: 'Kamis',
      5: 'Jumat',
      6: 'Sabtu',
      7: 'Minggu',
    };

    setState(() {
      _namaHari = hariMap[nomor] ?? 'Nomor tidak valid (hanya 1-7)';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cek Hari')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _numberController,
              decoration: const InputDecoration(
                labelText: 'Masukkan Nomor Hari (1-7)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _cekHari, child: const Text('Cek Hari')),
            const SizedBox(height: 40),
            Text(
              _namaHari,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
