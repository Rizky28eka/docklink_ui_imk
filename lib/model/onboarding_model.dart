class OnboardModel {
  String? image;
  String? text;
  String? subtext;

  OnboardModel(
      {required this.image, required this.text, required this.subtext});
}

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    image: "assets/image/onboarding1.png",
    text: "Book an appoinment",
    subtext:
        "Easy, Quick and safest way to book your appointments. Find your specialist doctor today.",
  ),
  OnboardModel(
    image: "assets/image/onboarding1.png",
    text: "Book an appoinment",
    subtext:
        "Discover seamless appointment booking with our app. Find specialized doctors and schedule with ease. Your wellness journey starts here!",
  ),
  OnboardModel(
    image: "assets/image/onboarding1.png",
    text: "Ya da güvende hissetmek için bir adım geri kalmak",
    subtext:
        "Easy, Quick and safest way to book your appointments. Find your specialist doctor today.",
  ),
];
