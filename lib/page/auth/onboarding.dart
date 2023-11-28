import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slicing_docklink_ui_imk/utils/color_string.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../model/onboarding_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  void _nextPage() {
    if (currentIndex < screens.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      // Handle reaching the end of onboarding screens, for example, navigate to the next screen
      // or show a dialog indicating that onboarding is completed.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: tColor.BackGraOnboarding),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: screens.length,
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 300,
                          child: Image.asset(screens[index].image!),
                        ),
                        Text(
                          screens[index].text!,
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                            color: tColor.mc_peru,
                            fontFamily: 'NotoSerif',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          screens[index].subtext!,
                          style: TextStyle(
                            fontSize: 18.0, // Mengurangi ukuran font subtext
                            fontWeight: FontWeight.bold,
                            color: tColor.mc_peru,
                            fontFamily: 'NotoSerif',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10.0),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: 3,
                          effect: ExpandingDotsEffect(
                            activeDotColor: Colors.brown,
                            dotColor: tColor.mc_sienna,
                            dotHeight: 12,
                            dotWidth: 12,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              InkWell(
                onTap: _nextPage,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: tColor.mc_sienna,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
