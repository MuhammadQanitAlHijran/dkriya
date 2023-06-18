import 'package:flutter/material.dart';
import 'package:project_dkriya/helper/my_style.dart';
import 'package:project_dkriya/widget/video_card.dart';



class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  Widget videoTitleBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(110, 20, 110, 20),
      child: Center(
        child: Text(
          "Video",
          style: MyStyle.appBarTitle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget videoList() {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            // margin: EdgeInsets.fromLTRB(10, 20, 20, 20),
            child: Column(children: [
              VideoCard(),
              SizedBox(
                height: 15,
              ),
              VideoCard(),
              SizedBox(
                height: 15,
              ),
              VideoCard(),
              SizedBox(
                height: 15,
              ),
              VideoCard(),
              SizedBox(
                height: 15,
              ),
              VideoCard(),
            ]),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            children: [
              videoTitleBar(),
              SizedBox(
                height: 0,
              ),
              videoList()
            ],
          ),
        ),
      )),
    );
  }
}
