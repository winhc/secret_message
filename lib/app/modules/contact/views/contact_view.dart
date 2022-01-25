import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:secret_message/app/routes/app_pages.dart';

import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: 'Message',
          middle: Text('Contacts'),
          trailing: Icon(
            CupertinoIcons.add,
            size: 25,
            color: CupertinoColors.activeBlue,
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // CupertinoSliverNavigationBar(
              //   previousPageTitle: 'Message',
              //   largeTitle: const Text('Contacts'),
              // ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Card(
                    elevation: 0.3,
                    margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text('Name'),
                      subtitle: Text('My Card'),
                      onTap: () {
                        Get.toNamed(Routes.PROFILE,
                            parameters: {'name': 'My Card'});
                      },
                    ),
                  )
                ]),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Card(
                      elevation: 0.3,
                      child: ListTile(
                        title: Text('Title $index'),
                        onTap: () {
                          Get.toNamed(Routes.PROFILE,
                              parameters: {'name': 'Title $index'});
                        },
                      ),
                    );
                  },
                  childCount: 10, // 10 list items
                ),
              ),
            ],
          ),
        ));
  }
}
