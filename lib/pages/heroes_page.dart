import 'package:flutter/material.dart';
import 'package:flutterwithgetx/controllers/heroes_controller.dart';
import 'package:flutterwithgetx/controllers/profile_controller.dart';
import 'package:get/get.dart';

class HeroesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HeroesController _heroesController = Get.put(HeroesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Heroes'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Obx(
        () => !_heroesController.dataAvailable
            ? const Center(child: CircularProgressIndicator())
            : _heroesController.dataError
                ? const Center(child: Text('API Error'))
                : ListView.builder(
                    itemBuilder: (context, i) {
                      final hero = _heroesController.heroes[i];
                      return ListTile(
                        leading: Text(
                          '${hero.localizedName}',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        title: Text(hero.primaryAttr!.toUpperCase()),
                      );
                    },
                    itemCount: _heroesController.heroes.length,
                  ),
      ),
    );
  }
}
