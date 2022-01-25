import 'dart:convert';

import 'package:get/get.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:rsa_encrypt/rsa_encrypt.dart';
import 'package:pointycastle/api.dart' as crypto;

class HomeController extends GetxController {
  var rsaPublicKey = Future.value().obs;
  var rsaPrivateKey = Future.value().obs;

  var signMessage = ''.obs;

  //Future to hold our KeyPair
  late Future<crypto.AsymmetricKeyPair> futureKeyPair;

  //to store the KeyPair once we get data from our future
  late crypto.AsymmetricKeyPair keyPair;

  // RSA key helper
  var helper = RsaKeyHelper();

  getKeyPair() {
    futureKeyPair = helper.computeRSAKeyPair(helper.getSecureRandom());
    futureKeyPair.then((value) {
      // crypto.AsymmetricKeyPair keyPair = value;
      keyPair = value;
      rsaPublicKey.value = Future.value(
          helper.encodePublicKeyToPemPKCS1(keyPair.publicKey as RSAPublicKey));

      rsaPrivateKey.value = Future.value(helper
          .encodePrivateKeyToPemPKCS1(keyPair.privateKey as RSAPrivateKey));

      print(('rsaPublicKey => $rsaPublicKey'));
      print(('rsaPrivateKey => $rsaPrivateKey'));
    });
  }

  encryptMessage(String plainText) {
    print('plainText==> $plainText');
    var tempEncode = encrypt(plainText, keyPair.publicKey as RSAPublicKey);
    print('Encode 1 ==> ${tempEncode.length}');

    signMessage.value = base64.encode(utf8.encode(tempEncode));
    print('Encode 2 ==> ${signMessage.value.length}');

    String decoded = utf8.decode(base64.decode(signMessage.value));
    print('base64 Decode ==> $decoded');

    decryptMessage(decoded);
  }

  decryptMessage(String cypherText) {
    print('cypherText==> $cypherText');
    var data = decrypt(cypherText.trim(), keyPair.privateKey as RSAPrivateKey);
    print('Decrypt ==> $data');
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getKeyPair();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
