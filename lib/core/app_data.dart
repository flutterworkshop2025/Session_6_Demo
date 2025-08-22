
import '../feature/Tasks/data/model/Priority.dart';
import '../feature/Tasks/data/model/priority_level.dart';
import 'app_colors.dart';

class Data {
  static List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  static List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static Map<PriorityLevel, Priority> priorities = {
    PriorityLevel.high: Priority(title: "High", color: AppColors.highPriorityColor),
    PriorityLevel.moderate: Priority(title: "Moderate", color: AppColors.midPriorityColor),
    PriorityLevel.low: Priority(title: "Low", color: AppColors.lowPriorityColor),
  };

}
