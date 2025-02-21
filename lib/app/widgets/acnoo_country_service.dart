import 'package:country_picker/country_picker.dart';

//-----------Country Services----------//
class AcnooCountryService {
  static final List<Country> countries = [];

  //--------Get All the countries--------//
  static void getCountries() {
    final List<String> exclude = ['GS', 'HM', 'FK'];
    final List<Country> country = CountryService().getAll();

    countries.clear();

    for (var element in country) {
      if (!exclude.contains(element.countryCode)) {
        countries.add(element);
      }
    }
  }

  //--------Get Suggestions--------//
  static List<String> getSuggestion(String query) {
    List<String> matches = <String>[];
    for (var element in countries) {
      matches.add(element.name);
    }

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
