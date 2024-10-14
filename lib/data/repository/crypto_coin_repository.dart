import 'package:crypto_app/data/repository/abstract_coin_repository.dart';
import 'package:crypto_app/features/bitcoins/models/crypto_coin.dart';
import 'package:dio/dio.dart';

class CryptoCoinRepository implements AbstractCoinRepository{
  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response =
        await Dio().get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,BNB,ETH,SOL,AID,DOV,CAG&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data["RAW"] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'];
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];

      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
      );
    }).toList();
    return cryptoCoinsList;
  }
}
