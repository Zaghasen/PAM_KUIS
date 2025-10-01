import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              // Ganti 'assets/profile.jpg' dengan path gambar Anda
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              const SizedBox(height: 24),
              Card(
                child: Column(
                  children: [
                    _buildProfileTile(
                      icon: Icons.person,
                      title: 'Nama',
                      subtitle: 'Zalfa Ghalib Hussein',
                    ),
                    const Divider(height: 1),
                    _buildProfileTile(
                      icon: Icons.badge,
                      title: 'NIM',
                      subtitle: '124230097',
                    ),
                    const Divider(height: 1),
                    _buildProfileTile(
                      icon: Icons.cake,
                      title: 'Tempat, Tanggal Lahir',
                      subtitle: 'Magelang, 11 November 2004',
                    ),
                    const Divider(height: 1),
                    _buildProfileTile(
                      icon: Icons.favorite,
                      title: 'Hobi',
                      subtitle: 'Hiking',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // REVISI: UI dibuat lebih menarik menggunakan ListTile
  Widget _buildProfileTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
