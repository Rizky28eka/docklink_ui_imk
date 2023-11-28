class OnboardModel {
  String? image;
  String? text;

  OnboardModel({required this.image, required this.text});
}

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    image: "assets/image/onboarding1.png",
    text: "Yaşadığımız her an önümüzde iki seçenek vardır ;",
  ),
  OnboardModel(
    image: "images/intro_iki.png",
    text: "Gelişime doğru bir adım atmak, ",
  ),
  OnboardModel(
    image: "images/intro_uc.png",
    text: "Ya da güvende hissetmek için bir adım geri kalmak",
  ),
];
