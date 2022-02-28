import 'package:flutterwithgetx/core/http_client.dart';
import 'package:flutterwithgetx/models/profile_model.dart';

class ProfileService {
  static Future<ProfileModel> getProfile({required String url}) async {
    try {
      final res = await HttpClient.get(url: url);
      return ProfileModel.fromJson(res.data);
    } catch (err) {
      print(err);
      return ProfileModel();
    }
  }
}
