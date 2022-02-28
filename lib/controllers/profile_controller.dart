import 'package:flutterwithgetx/models/profile_model.dart';
import 'package:flutterwithgetx/services/profile_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final Rx<ProfileModel?> _profile = ProfileModel().obs;
  final _dataAvailable = false.obs;
  final _dataError = false.obs;

  Rx<ProfileModel?> get profile => _profile;
  bool get dataAvailable => _dataAvailable.value;
  bool get dataError => _dataError.value;

  @override
  void onInit() async {
    await getProfile();
    super.onInit();
  }

  Future<void> getProfile() async {
    _profile.value = (await ProfileService.getProfile(url: API_URL));
    _dataAvailable.value = profile.value?.name != null;
    if (!_dataAvailable.value) {
      _dataError.value = true;
    }
  }
}

const API_URL = 'https://api.github.com/users/caiquecruz';
