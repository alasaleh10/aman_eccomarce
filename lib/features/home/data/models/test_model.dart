import '../../../../core/utils/app_assets.dart';

class TestModel {
  final String title, subTitile, image;
  final double price;

  TestModel(
      {required this.title,
      required this.subTitile,
      required this.image,
      required this.price});
}

List<TestModel> testList = [
  TestModel(
      title: 'جبنة أبو الولد قلبلة للدهن',
      subTitile: 'أبو الولد',
      image: Assets.imagesTestItem1,
      price: 9500.0),
  TestModel(
      title: 'شيبس ليز فورنو',
      subTitile: 'ليز',
      image: Assets.imagesTestItem2,
      price: 1550.0),
  TestModel(
      title: 'مرقة دجاج من ماجى',
      subTitile: 'ماجي',
      image: Assets.imagesTestItem3,
      price: 6500.0)
];
