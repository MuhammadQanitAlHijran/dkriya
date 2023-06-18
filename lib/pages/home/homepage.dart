import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_dkriya/helper/my_color.dart';
import 'package:project_dkriya/helper/my_style.dart';
import 'package:project_dkriya/widget/product_card.dart';
import 'package:project_dkriya/pages/home/keranjang.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget searchBox(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(9, 9, 12, 9),
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColor.primaryColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          height: 42,
          width: 260,
          child: Row(
            children: [
              Image.asset(
                "assets/icon_search.png",
                width: 24,
                height: 24,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: TextFormField(
                  obscureText: true,
                  // controller: passwordController,
                  style: GoogleFonts.poppins(
                      fontSize: 14, color: MyColor.primaryTextColor),
                  decoration: InputDecoration.collapsed(
                      hintText: "Cari Barang",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 6,
        ),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MyColor.primaryColor),
          child: TextButton(
            onPressed: () {},
            child: Image.asset(
              "assets/icon_chat.png",
            ),
          ),
        ),
        SizedBox(
          width: 6,
        ),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MyColor.primaryColor),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/keranjang');
            },
            child: Image.asset(
              "assets/icon_keranjang.png",
            ),
          ),
        ),
      ],
    );
  }

  Widget categoryWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: MyColor.primaryColor,
                border: null),
            child: Text(
              "Souvenir",
              style: MyStyle.categoryText.copyWith(color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent,
                border: Border.all(
                  color: MyColor.primaryColor,
                )),
            child: Text(
              "Perlengkapan",
              style: MyStyle.categoryText.copyWith(color: MyColor.primaryColor),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent,
                border: Border.all(
                  color: MyColor.primaryColor,
                )),
            child: Text(
              "Hiasan",
              style: MyStyle.categoryText.copyWith(color: MyColor.primaryColor),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent,
                border: Border.all(
                  color: MyColor.primaryColor,
                )),
            child: Text(
              "Koleksi",
              style: MyStyle.categoryText.copyWith(color: MyColor.primaryColor),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent,
                border: Border.all(
                  color: MyColor.primaryColor,
                )),
            child: Text(
              "Buatan Tangan",
              style: MyStyle.categoryText.copyWith(color: MyColor.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget recommendationWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Rekomendasi",
            style: MyStyle.titleText
                .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/prodak');
            },
            child: Text(
              "Lihat Semua",
              style: MyStyle.subTitleText.copyWith(fontSize: 14, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }

  Widget recommendationProduct() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 20, 20, 20),
          child: Row(children: [
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: Column(
              children: [
                searchBox(context),
                SizedBox(height: 30),
                categoryWidget(),
                recommendationWidget(context),
                recommendationProduct(),
                recommendationWidget(context),
                recommendationProduct(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
