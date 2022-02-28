import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterwithgetx/controllers/global_controller.dart';
import 'package:flutterwithgetx/controllers/global_controller.dart';
import 'package:flutterwithgetx/pages/profile_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _menuItem({required String title, required String route}) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).pop();
        await Get.toNamed(route);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalController _globalController = Get.put(GlobalController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter with GetX'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () async {
            await showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Wrap(
                    children: [
                      Container(
                        padding: EdgeInsets.all(30),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _menuItem(title: 'My Profile', route: '/profile'),
                              Divider(),
                              SizedBox(height: 30),
                              _menuItem(title: 'Heroes', route: '/heroes'),
                              Divider(),
                              SizedBox(height: 30),
                              _menuItem(title: 'Contact', route: '/contact'),
                              Divider(),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                });
          },
          icon: SvgPicture.asset('assets/icons/menu.svg'),
        ),
        actions: [
          IconButton(
            onPressed: () async => await Get.to(() => ProfilePage()),
            icon: const Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              if (_globalController.themeMode == AppThemes.lightTheme) {
                _globalController.switchThemeMode(appThemes: AppThemes.darkTheme);
              } else {
                _globalController.switchThemeMode(appThemes: AppThemes.lightTheme);
              }
            },
            icon: const Icon(
              Icons.wb_sunny,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(),
    );
  }
}
