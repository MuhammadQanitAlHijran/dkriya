import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_dkriya/helper/my_color.dart';

import '../helper/my_style.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      // margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
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
              "assets/thumbnail_video.jpg",
              height: 150,
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
              "Proses pembuatan keramik",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "DKriya",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: MyColor.primaryColor,
                      fontSize: 12),
                ),
                Text(
                  "1000 Tayangan",
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
