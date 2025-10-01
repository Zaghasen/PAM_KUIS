import 'dart:math';
import 'package:flutter/material.dart';

class PyramidScreen extends StatefulWidget {
  const PyramidScreen({super.key});

  @override
  State<PyramidScreen> createState() => _PyramidScreenState();
}

class _PyramidScreenState extends State<PyramidScreen> {
  final _sisiController = TextEditingController();
  final _tinggiController = TextEditingController();
  String _volume = '-';
  String _luasPermukaan = '-';

  // REVISI: Menambahkan dispose untuk membersihkan controller
  @override
  void dispose() {
    _sisiController.dispose();
    _tinggiController.dispose();
    super.dispose();
  }

  void _hitung() {
    final double sisi = double.tryParse(_sisiController.text) ?? 0;
    final double tinggi = double.tryParse(_tinggiController.text) ?? 0;

    if (sisi > 0 && tinggi > 0) {
      final double volumeValue = (1 / 3) * pow(sisi, 2) * tinggi;
      final double tinggiSegitigaSisi = sqrt(pow(sisi / 2, 2) + pow(tinggi, 2));
      final double luasPermukaanValue =
          pow(sisi, 2) + (2 * sisi * tinggiSegitigaSisi);

      setState(() {
        _volume = volumeValue.toStringAsFixed(2);
        _luasPermukaan = luasPermukaanValue.toStringAsFixed(2);
      });
    } else {
      setState(() {
        _volume = 'Input tidak valid';
        _luasPermukaan = 'Input tidak valid';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Piramida')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _sisiController,
              decoration: const InputDecoration(
                labelText: 'Panjang Sisi Alas',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tinggiController,
              decoration: const InputDecoration(
                labelText: 'Tinggi Piramida',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _hitung, child: const Text('Hitung')),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Hasil Perhitungan:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('Volume: $_volume', style: const TextStyle(fontSize: 18)),
            Text(
              'Luas Permukaan: $_luasPermukaan',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
