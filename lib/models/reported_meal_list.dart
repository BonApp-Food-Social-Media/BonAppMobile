import 'package:bon_app_mobile/enum/time.dart';

import '../enum/filters.dart';

class ReportedMealListModel {
  const ReportedMealListModel({
    required this.reportedMealList,
    required this.description,
  });

  final int reportedMealList;
  final String description;
}
