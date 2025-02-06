import 'package:bon_app_mobile/models/reported_meal_list.dart';

class ReportedMealSingleton {
  static final ReportedMealSingleton _instance = ReportedMealSingleton._internal();

  List<ReportedMealListModel>? reportedMealList;

  factory ReportedMealSingleton() {
    return _instance;
  }

  ReportedMealSingleton._internal();

  void setReportedMeal(List<ReportedMealListModel> reportedMeal) {
    reportedMealList = reportedMeal;
  }

  void clearReportedMealList() {
    reportedMealList = [];
  }
}