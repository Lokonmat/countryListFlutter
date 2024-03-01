import 'package:http/http.dart' as http;

class CountriesApi {
  static Future fetchCountries() async {
    Uri url = Uri.parse(
        "https://restcountries.com/v3.1/all?fields=name,flags,cca2,capital,region,languages,population");
    return http.get(url);
  }
}
