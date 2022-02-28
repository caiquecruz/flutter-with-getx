import 'package:flutterwithgetx/core/http_client.dart';
import 'package:flutterwithgetx/models/hero_model.dart';

class HeroesService {
  static Future<List<HeroModel>> getHeroes({required String url}) async {
    try {
      final res = await HttpClient.get(url: url);
      return (res.data as List).map((hero) => HeroModel.fromJson(hero)).toList();
    } catch (err) {
      print(err);
      return [];
    }
  }
}
