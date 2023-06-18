import 'package:flutter/material.dart';
import 'package:project_dkriya/helper/my_color.dart';
import 'package:project_dkriya/helper/my_style.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.fromLTRB(145, 10, 145, 10),
                    child: Image.asset(
                      "assets/logo2.png",
                      width: 75,
                      height: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(132, 0, 131, 0),
                    child: Text(
                      "Daftar",
                      style: MyStyle.titleText,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    // width: double.infinity,
                    // height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah memiliki akun? ",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Masuk",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: MyColor.primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Nama Lengkap",
                    style: MyStyle.labelFormText.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: MyColor.primaryTextColor),
                            decoration: InputDecoration.collapsed(
                                hintText: "Masukkan nama lengkap anda",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Email",
                    style: MyStyle.labelFormText.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: MyColor.primaryTextColor),
                            decoration: InputDecoration.collapsed(
                                hintText: "Masukkan email anda",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Password",
                    style: MyStyle.labelFormText.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: MyColor.primaryTextColor),
                            decoration: InputDecoration.collapsed(
                                hintText: "Masukkan password anda",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Konfirmasi Password",
                    style: MyStyle.labelFormText.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: MyColor.primaryTextColor),
                            decoration: InputDecoration.collapsed(
                                hintText: "Konfirmasi password anda",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
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
                          onPressed: () {},
                          child: Text(
                            "Daftar",
                            style: MyStyle.labelFormText.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))),
                  SizedBox(
                    height: 15,
                  ),
                  // Container(
                  //     width: double.infinity,
                  //     height: 56,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(15),
                  //         color: MyColor.secondaryColor),
                  //     child: TextButton(
                  //         onPressed: () {},
                  //         child: Text(
                  //           "Masuk",
                  //           style: MyStyle.labelFormText.copyWith(
                  //               color: MyColor.primaryColor,
                  //               fontWeight: FontWeight.bold),
                  //         ))),
                  // SizedBox(
                  //   height: 15,
                  // ),
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
                              "Daftar dengan Google",
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
        ));
  }
}
