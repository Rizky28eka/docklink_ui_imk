import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:slicing_docklink_ui_imk/utils/color_string.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widget/OnboardingItemWidget.dart';
import 'login_page.dart';

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  const OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  static const List<OnboardingItem> _items = [
    OnboardingItem(
      image: 'assets/images/onboarding1.png',
      title: 'Find a Doctor',
      description:
          'Search for doctors based on specialization, location, or patient reviews.',
    ),
    OnboardingItem(
      image: 'assets/images/onboarding2.png',
      title: 'Choose Time and Location',
      description: 'Easily pick a convenient appointment time and location.',
    ),
    OnboardingItem(
      image: 'assets/images/onboarding3.png',
      title: 'Emergency Services',
      description:
          'Receive timely notifications and reminders to keep your schedule on track.',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController(initialPage: 0);
    final index = useState(0);

    controller.addListener(() {
      if (index.value != controller.page?.round()) {
        index.value = controller.page?.round() ?? 0;
      }
    });

    void done() {
      // Pindahkan pengguna ke halaman login setelah onboarding selesai
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: TColor.backGraOnboarding),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: PageView(
                      controller: controller,
                      children: _items.map((item) {
                        return OnboardingItemWidget(item: item);
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8.0),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: _items.length,
                    effect: WormEffect(
                      activeDotColor: Colors.blue,
                      dotColor: Colors.grey,
                      dotHeight: 8,
                      spacing: 8,
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (index.value < _items.length - 1) {
                          controller.animateToPage(index.value + 1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        } else {
                          done();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: constraints.maxWidth * 0.1,
                            vertical: constraints.maxHeight * 0.02),
                        primary: Colors.blue,
                      ),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            index.value < _items.length - 1 ? 'Next' : 'Done',
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.04,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.02),
                          if (index.value < _items.length - 1)
                            Icon(Icons.arrow_forward, color: Colors.white),
                          if (index.value == _items.length - 1)
                            Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
              ],
            );
          },
        ),
      ),
    );
  }
}
