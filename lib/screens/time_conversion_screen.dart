import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeConversionScreen extends StatefulWidget {
  const TimeConversionScreen({super.key});

  @override
  State<TimeConversionScreen> createState() => _TimeConversionScreenState();
}

class _TimeConversionScreenState extends State<TimeConversionScreen> {
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final wibTime = _currentTime;
    final witaTime = _currentTime.add(const Duration(hours: 1));
    final witTime = _currentTime.add(const Duration(hours: 2));

    final formatter = DateFormat('EEEE, dd MMMM yyyy\nHH:mm:ss');

    return Scaffold(
      appBar: AppBar(title: const Text('Konversi Waktu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTimeCard(
              'WIB (Waktu Indonesia Barat)',
              formatter.format(wibTime),
            ),
            const SizedBox(height: 16),
            _buildTimeCard(
              'WITA (Waktu Indonesia Tengah)',
              formatter.format(witaTime),
            ),
            const SizedBox(height: 16),
            _buildTimeCard(
              'WIT (Waktu Indonesia Timur)',
              formatter.format(witTime),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text('Segarkan Waktu'),
              onPressed: () {
                setState(() {
                  _currentTime = DateTime.now();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // REVISI: UI dibuat lebih menarik menggunakan Card
  Widget _buildTimeCard(String title, String time) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              time,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
