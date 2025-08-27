import '../../../../utils/api/api_consumer.dart';

class QouteService {
  final ApiConsumer apiConsumer;

  QouteService({required this.apiConsumer});

  Future<dynamic> loadQoutes() async {
    final response = await apiConsumer.get("https://favqs.com/api/quotes");
    return response;
  }
}
