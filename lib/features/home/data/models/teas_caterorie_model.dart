import '../../../../core/utils/app_assets.dart';

class TestCategorieModel {
  final String image, title;

  TestCategorieModel({required this.image, required this.title});
}

List<TestCategorieModel> testCategorieList = [
  TestCategorieModel(image: Assets.imagesTestCateroriemeet, title: 'اللحوم'),
  TestCategorieModel(image: Assets.imagesTestCaterorieBird, title: 'مخبوزات'),
  TestCategorieModel(image: Assets.imagesTestCaterorieMailk, title: 'الألبان'),
  TestCategorieModel(image: Assets.imagesTestCategorise, title: 'المقرمشات')
];
