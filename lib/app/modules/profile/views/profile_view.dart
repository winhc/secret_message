import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Contacts',
        trailing: Text(
          'Edit',
          style: TextStyle(color: CupertinoColors.activeBlue),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              CircleAvatar(
                radius: 40,
                child: Icon(
                  CupertinoIcons.qrcode,
                  size: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  Get.parameters['name']!,
                  style: TextStyle(fontSize: 20),
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Container(
                      width: 80,
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(CupertinoIcons.phone_fill),
                          Text(
                            'Call',
                            style: TextStyle(color: CupertinoColors.activeBlue),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      width: 80,
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(CupertinoIcons.chat_bubble_fill),
                          Text('Message',
                              style:
                                  TextStyle(color: CupertinoColors.activeBlue))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                child: ListTile(
                  // leading: Icon(CupertinoIcons.phone),
                  title: Text('09-332-344-983'),
                  subtitle: Text('phone'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
