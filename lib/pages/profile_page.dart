import 'package:flutter/material.dart';
import 'package:flutterwithgetx/controllers/profile_controller.dart';
import 'package:flutterwithgetx/models/profile_model.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final ProfileController _profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Obx(() {
        final profile = _profileController.profile.value;
        return !_profileController.dataAvailable
            ? const Center(child: CircularProgressIndicator())
            : _profileController.dataError
                ? const Center(child: Text('API Error'))
                : Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile!.name!,
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          profile.bio!,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  );
      }),
    );
  }
}
