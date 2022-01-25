import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secret_message/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return CupertinoPageScaffold(
        child: CustomScrollView(
      slivers: [
        // The CupertinoSliverNavigationBar
        CupertinoSliverNavigationBar(
          leading: Material(
              child: IconButton(
            icon: const Icon(CupertinoIcons.profile_circled),
            onPressed: () => Get.toNamed(Routes.CONTACT),
          )),
          trailing: Material(
              child: IconButton(
            icon: const Icon(CupertinoIcons.add),
            onPressed: () {},
          )),
          largeTitle: const Text('Message'),
        ),

        // Other sliver elements
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                elevation: 0.5,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('$index'),
                  ),
                  title: Text(
                    'Title $index',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text('Subtitle $index'),
                  trailing: Icon(
                    CupertinoIcons.right_chevron,
                    size: 20,
                  ),
                ),
              );
            },
            childCount: 10, // 10 list items
          ),
        ),
      ],
    ));
  }
}
