// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../model/qoute.dart';
import '../service/qoute_service.dart';

class QouteRepository {
  final QouteService qouteService;

  QouteRepository(this.qouteService);

  Future<List<Qoute>> loadQoute() async {
    final response = await qouteService.loadQoutes();
    List<Qoute> qoutes = response.map<Qoute>((qoute) {
      Qoute q =Qoute.fromJson(qoute);
      print('${q.content} — ${q.author}');
  return q;
    }).toList();
    return qoutes;
  }
}
