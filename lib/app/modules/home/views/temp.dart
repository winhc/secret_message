import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final TextEditingController _messageController = TextEditingController();
  // final _homeController
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => controller.getKeyPair(),
                  child: Text('Generate new key')),
              TextField(
                controller: _messageController,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      controller.encryptMessage(_messageController.text);
                    }
                  },
                  child: const Text('Encrypt')),
              ElevatedButton(
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      controller.encryptMessage(_messageController.text);
                    }
                  },
                  child: const Text('Decrypt')),
              Text('Data => ${controller.signMessage.value}'),
              // Expanded(
              //     flex: 1,
              //     child: FutureBuilder<
              //         crypto.AsymmetricKeyPair<crypto.PublicKey,
              //             crypto.PrivateKey>>(
              //       future: controller.futureKeyPair,
              //       builder: (context, snapshot) {
              //         if (snapshot.connectionState == ConnectionState.waiting) {
              //           return Center(
              //               child: CircularProgressIndicator.adaptive());
              //         } else if (snapshot.hasData) {
              //           controller.keyPair = snapshot.data!;
              //           return Column(
              //             crossAxisAlignment: CrossAxisAlignment.stretch,
              //             children: [
              //               MaterialButton(
              //                 color: Colors.red,
              //                 child: Text("Get Private Key"),
              //                 onPressed: () {
              //                   futureText = Future.value(controller.helper
              //                       .encodePrivateKeyToPemPKCS1(controller
              //                           .keyPair.privateKey as RSAPrivateKey));
              //                 },
              //               ),
              //             ],
              //           );
              //         }
              //         return Container();
              //       },
              //     )),
              Expanded(
                flex: 2,
                child: Card(
                    child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: FutureBuilder(
                      future: controller.rsaPrivateKey.value,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return SingleChildScrollView(
                              // the inkwell is used to register the taps
                              // in order to be able to copy the text
                              child: Text('${snapshot.data}'));
                        } else {
                          return Center(
                            child: Text("Your keys will appear here"),
                          );
                        }
                      }),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
