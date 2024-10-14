import 'package:crypto_app/features/bitcoins/screens/crypto_coins/crypto_list_screen.dart';
import 'package:crypto_app/features/bitcoins/screens/bitcoin/bitcoin.dart';

final routes = {
  '/': (context) => const CryptoListScreen(),
  '/coin': (context) => const BitcoinScreen(),
};
