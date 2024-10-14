import 'package:crypto_app/data/repository/crypto_coin_repository.dart';
import 'package:crypto_app/features/bitcoins/models/crypto_coin.dart';
import 'package:get/get.dart';

class CryptoCoinsController extends GetxController {
  static CryptoCoinsController get instance => Get.find();
  List<CryptoCoin>? cryptoCoinsList;
  final loaded = false.obs;

  @override
  void onInit() {
    loadCryptoCoins();
    super.onInit();
  }

  Future<void> loadCryptoCoins()  async {
    loaded.value = true;
    cryptoCoinsList = await CryptoCoinRepository().getCoinsList();
    loaded.value = false;
  }
}
