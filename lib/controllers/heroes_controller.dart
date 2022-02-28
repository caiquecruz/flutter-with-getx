import 'package:flutterwithgetx/models/hero_model.dart';
import 'package:flutterwithgetx/services/heroes_service.dart';
import 'package:get/get.dart';

class HeroesController extends GetxController {
  List<HeroModel> _heroes = <HeroModel>[].obs;
  final _dataAvailable = false.obs;
  final _dataError = false.obs;

  List<HeroModel> get heroes => [..._heroes];
  bool get dataAvailable => _dataAvailable.value;
  bool get dataError => _dataError.value;

  @override
  void onInit() async {
    await getHeroes();
    super.onInit();
  }

  Future<void> getHeroes() async {
    _heroes = await HeroesService.getHeroes(url: API_URL);
    _dataAvailable.value = heroes.isNotEmpty;
    if (!_dataAvailable.value) {
      _dataError.value = true;
    }
  }
}

const API_URL = 'https://api.opendota.com/api/heroes';
