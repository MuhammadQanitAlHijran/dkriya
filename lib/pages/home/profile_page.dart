import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_dkriya/helper/my_color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<ProfileData> profileData;

  @override
  void initState() {
    super.initState();
    profileData = fetchProfileData();
  }

  Future<ProfileData> fetchProfileData() async {
    final response = await http.get(Uri.parse('https://s3-id-jkt-1.kilatstorage.id/d3si-telu/dkriya/profil.json'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return ProfileData.fromJson(jsonData);
    } else {
      throw Exception('Failed to load profile data');
    }
  }

  Widget buttonUbahProfile() {
    return GestureDetector(
      onTap: () {
        fetchProfileData().then((profile) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Data Profil'),
                content: Text(json.encode(profile.toJson())),
                actions: [
                  TextButton(
                    child: const Text('Tutup'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        });
      },
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFE6E9EA),
          ),
        ),
        child: Row(
          children: const [
            SizedBox(
              width: 12,
            ),
            Text(
              "Informasi Profile",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF032630),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonPengaturan(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/settings');
      },
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFE6E9EA),
          ),
        ),
        child: Row(
          children: const [
            SizedBox(
              width: 12,
            ),
            Text(
              "Pengaturan",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF032630),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Center(
              child: FutureBuilder<ProfileData>(
                future: profileData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final profile = snapshot.data!;
                    return Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(profile.imageUrl),
                          radius: 50,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          profile.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        buttonUbahProfile(),
                        buttonPengaturan(context),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileData {
  final int id;
  final String name;
  final String email;
  final String address;
  final String city;
  final String country;
  final String phone;
  final String imageUrl;

  ProfileData({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.phone,
    required this.imageUrl,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      phone: json['phone'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'country': country,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }
}
