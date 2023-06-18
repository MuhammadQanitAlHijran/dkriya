import 'package:flutter/material.dart';
import 'package:project_dkriya/helper/my_color.dart';
import 'package:project_dkriya/helper/my_style.dart';
import 'package:project_dkriya/pages/login_screen.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
        title: Text(
          'Pengaturan',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    'Akun',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Profil',
                    style: MyStyle.categoryText,
                  ),
                  onTap: () {
                    // Tambahkan logika untuk aksi ketika pengguna men-tap 'Profil'
                  },
                ),
                ListTile(
                  title: Text(
                    'Alamat',
                    style: MyStyle.categoryText,
                  ),
                  onTap: () {
                    // Tambahkan logika untuk aksi ketika pengguna men-tap 'Alamat'
                  },
                ),
                ListTile(
                  title: Text(
                    'Rekening Bank',
                    style: MyStyle.categoryText,
                  ),
                  onTap: () {
                    // Tambahkan logika untuk aksi ketika pengguna men-tap 'Rekening Bank'
                  },
                ),
                ListTile(
                  title: Text(
                    'Produk Disukai',
                    style: MyStyle.categoryText,
                  ),
                  onTap: () {
                    // Tambahkan logika untuk aksi ketika pengguna men-tap 'Produk Disukai'
                  },
                ),
                ListTile(
                  title: Text(
                    'Video Disimpan',
                    style: MyStyle.categoryText,
                  ),
                  onTap: () {
                    // Tambahkan logika untuk aksi ketika pengguna men-tap 'Video Disimpan'
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Umum',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Notifikasi',
                    style: MyStyle.categoryText,
                  ),
                  onTap: () {
                    // Tambahkan logika untuk aksi ketika pengguna men-tap 'Notifikasi'
                  },
                ),
                ListTile(
                  title: Text(
                    'Bahasa',
                    style: MyStyle.categoryText,
                  ),
                  onTap: () {
                    // Tambahkan logika untuk aksi ketika pengguna men-tap 'Bahasa'
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Bantuan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Pusat Bantuan',
                    style: MyStyle.categoryText,
                  ),
                  onTap: () {
                    // Tambahkan logika untuk aksi ketika pengguna men-tap 'Pusat Bantuan'
                  },
                ),
                ListTile(
                  title: Text(
                    'Beri Rating',
                    style: MyStyle.categoryText,
                  ),
                  onTap: () {
                    // Tambahkan logika untuk aksi ketika pengguna men-tap 'Beri Rating'
                  },
                ),
                Divider(),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: TextStyle(fontSize: 18), // Ukuran teks tombol
                minimumSize: Size(double.infinity, 48), // Ukuran tombol
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
