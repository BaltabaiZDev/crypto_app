import 'package:crypto_app/features/bitcoins/models/crypto_coin.dart';

abstract class AbstractCoinRepository {
  Future<List<CryptoCoin>> getCoinsList();
}
