// ignore: slash_for_doc_comments
/**
    IN ORDER TO GET STARTED IM HARDCODING DUMMY DATA
    THIS WILL BE REPLACED BY AN API CALL
 **/

class Stock {
  final String symbol;
  final String company;
  final double price;

  Stock({this.symbol, this.company, this.price});

  static List<Stock> getAll() {
    List<Stock>stocks = List<Stock>();

    stocks.add(Stock(company: "Apple", symbol: "APPL", price: 258));
    stocks.add(Stock(company: "Alphabet", symbol: "ALPH", price: 999));
    stocks.add(Stock(company: "GE", symbol: "GE", price: 345));
    stocks.add(Stock(company: "Home Depot", symbol: "HD", price: 24));
    stocks.add(Stock(company: "Facebook", symbol: "FB", price: 1000));
    stocks.add(Stock(company: "Google", symbol: "GOOG", price: 2000));
    stocks.add(Stock(company: "Microsoft", symbol: "MSOFT", price: 234));

    return stocks;
    }
}