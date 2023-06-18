import 'package:flutter/material.dart';
import 'package:project_dkriya/helper/my_color.dart';
import 'package:project_dkriya/helper/my_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_dkriya/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(145, 30, 145, 10),
                  child: Image.asset(
                    "assets/logo2.png",
                    width: 75,
                    height: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(128, 0, 128, 0),
                  child: Text(
                    "Masuk",
                    style: MyStyle.titleText,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Email",
                  style: MyStyle.labelFormText,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 56,
                  // width: 343,
                  child: Column(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: emailController,
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: MyColor.primaryTextColor),
                          decoration: InputDecoration.collapsed(
                              hintText: "Masukkan email anda",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.normal)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                Text(
                  "Password",
                  style: MyStyle.labelFormText,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 56,
                  // width: 343,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: MyColor.primaryTextColor),
                          decoration: InputDecoration.collapsed(
                              hintText: "Masukkan password anda",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.normal)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 56,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: MyColor.primaryColor),
                    child: TextButton(
                        onPressed: () => {
                              if (authProvider.login(
                                  email: emailController.text,
                                  password: passwordController.text))
                                {Navigator.pushNamed(context, '/home')}
                              else
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: const Text(
                                              "Username atau password anda salah!")))
                                }
                            },
                        child: Text(
                          "Masuk",
                          style: MyStyle.labelFormText.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))),
                SizedBox(
                  height: 15,
                ),
                Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: MyColor.secondaryColor),
                    child: TextButton(
                        onPressed: () =>
                            {Navigator.pushNamed(context, '/signup')},
                        child: Text(
                          "Daftar",
                          style: MyStyle.labelFormText.copyWith(
                              color: MyColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ))),
                SizedBox(
                  height: 15,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/logo_google.png",
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                            child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Masuk dengan Google",
                            style: MyStyle.labelFormText.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
