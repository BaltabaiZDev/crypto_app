import 'package:crypto_app/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coinName,
    required this.priceInUSD,
    required this.imageUrl,
  });

  final String coinName;
  final String priceInUSD;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imageUrl),
      title: Text(coinName, style: TTextTheme.darkTextTheme.titleLarge),
      subtitle: Text("$priceInUSD \$", style: TTextTheme.darkTextTheme.bodySmall),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Get.toNamed('/coin', arguments: coinName);
      },
    );
  }
}
