import 'package:flutter/material.dart';
import 'day_check_screen.dart';
import 'pyramid_screen.dart';
import 'time_conversion_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildMenuButton(
                context,
                icon: Icons.change_history,
                label: 'Kalkulator Piramida',
                screen: const PyramidScreen(),
              ),
              const SizedBox(height: 16),
              _buildMenuButton(
                context,
                icon: Icons.timer,
                label: 'Konversi Waktu',
                screen: const TimeConversionScreen(),
              ),
              const SizedBox(height: 16),
              _buildMenuButton(
                context,
                icon: Icons.calendar_today,
                label: 'Cek Hari',
                screen: const DayCheckScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget untuk membuat tombol menu yang seragam
  Widget _buildMenuButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Widget screen,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: Icon(icon),
      label: Text(label, style: const TextStyle(fontSize: 16)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
