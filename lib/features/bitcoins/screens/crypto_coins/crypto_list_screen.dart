import 'package:crypto_app/features/bitcoins/controllers/crypto_coins.dart';
import 'package:crypto_app/features/bitcoins/screens/crypto_coins/widgets/crypto_coin_tile.dart';
import 'package:crypto_app/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoListScreen extends StatelessWidget {
  const CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CryptoCoinsController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Crypto App',
          style: TTextTheme.darkTextTheme.headlineMedium,
        ),
      ),
      body: Obx(
        () {
          if (controller.loaded.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.cryptoCoinsList == null) {
            return const Center(
              child: Text('Empty'),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.only(top: 16),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: controller.cryptoCoinsList!.length,
            itemBuilder: (context, i) {
              final coin = controller.cryptoCoinsList![i];
              return CryptoCoinTile(
                coinName: coin.name,
                priceInUSD: coin.priceInUSD.toString(),
                imageUrl: coin.imageUrl
              );
            },
          );
        },
      ),
    );
  }
}
