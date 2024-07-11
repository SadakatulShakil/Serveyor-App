import 'package:flutter/material.dart';
import 'package:serveyor_app/View/Screen/Dashboard/DashBoardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/onBoardingModel.dart';
import '../../../Utill/color_resources.dart';

class OnboardScreen extends StatefulWidget {
  OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  List<AllinOnboardModel> allinonboardlist = [
    AllinOnboardModel(
        "assets/images/designf.jpg",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Prepared by experts"),
    AllinOnboardModel(
        "assets/images/designs.jpg",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Delivery to your home"),
    AllinOnboardModel(
        "assets/images/designt.jpg",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Enjoy with everyone"),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: allinonboardlist.length,
            itemBuilder: (context, index) {
              return PageBuilderWidget(
                title: allinonboardlist[index].titlestr,
                description: allinonboardlist[index].description,
                imgurl: allinonboardlist[index].imgStr,
              );
            },
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                allinonboardlist.length,
                    (index) => buildDot(index: index),
              ),
            ),
          ),
          currentIndex < allinonboardlist.length - 1
              ? Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (currentIndex > 0) {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Text(
                    "Previous",
                    style: TextStyle(fontSize: 18,  color: primaryColor),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: accentLight,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (currentIndex < allinonboardlist.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 18, color: primaryColor),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: accentLight,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
              : Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.33,
            child: ElevatedButton(
              onPressed: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isFirstTime', false);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => DashBoardScreen()),
                );
              },
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 18, color: primaryColor),
              ),
              style: ElevatedButton.styleFrom(
                primary: accentLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? primaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class PageBuilderWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imgurl;

  PageBuilderWidget({
    required this.title,
    required this.description,
    required this.imgurl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Image.asset(imgurl),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: primaryColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}