import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_dkriya/helper/my_color.dart';

import '../helper/my_style.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 220,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 7,
                offset: Offset(0, 1))
          ]),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/foto_produk1.png",
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "Minuman Segar",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\Rp15.000,-",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: MyColor.primaryColor,
                      fontSize: 12),
                ),
                Text(
                  "75 terjual",
                  style: MyStyle.subTitleText
                      .copyWith(fontSize: 10, fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
