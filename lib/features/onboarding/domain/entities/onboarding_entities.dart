class OnboardModel {
  final String title;
  final String label;
  final String imageAssets;
  OnboardModel({
    required this.title,
    required this.label,
    required this.imageAssets,
  });
}

List<OnboardModel> tabs = [
  OnboardModel(
      title: 'Learn anytime \nand anywhere',
      label:
          'Quarantine is the perfect time to spend your \nday learning something new, from anywhere!',
      imageAssets: 'assets/images/onboard_1.png'),
  OnboardModel(
      title: 'Find a course \nfor you',
      label:
          'Quarantine is the perfect time to spend your \nday learning something new, from anywhere!',
      imageAssets: 'assets/images/onboard_2.png'),
  OnboardModel(
      title: 'Improve your skills',
      label:
          'Quarantine is the perfect time to spend your \nday learning something new, from anywhere!',
      imageAssets: 'assets/images/onboard_3.png'),
];
