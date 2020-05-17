// ignore: slash_for_doc_comments
/**
    IN ORDER TO GET STARTED IM HARDCODING DUMMY DATA
    THIS WILL BE REPLACED BY AN API CALL
 **/

class Crypto {
  final String crypto;
  final String symbol;
  final double price;

  Crypto({this.crypto, this.symbol, this.price});

  static List<Crypto> getAll() {
    List<Crypto>stocks = List<Crypto>();

    stocks.add(Crypto(crypto: "Bitcoin", symbol: "BTC", price: 258));
    stocks.add(Crypto(crypto: "Ethereum", symbol: "ETH", price: 999));
    stocks.add(Crypto(crypto: "Ripple", symbol: "XRP", price: 345));
    stocks.add(Crypto(crypto: "Crypterium", symbol: "CRPT", price: 24));
    stocks.add(Crypto(crypto: "Libra", symbol: "LBFB", price: 1000));
    stocks.add(Crypto(crypto: "Ion", symbol: "ION", price: 2000));
    stocks.add(Crypto(crypto: "Monero", symbol: "MNO", price: 234));

    return stocks;
  }
}