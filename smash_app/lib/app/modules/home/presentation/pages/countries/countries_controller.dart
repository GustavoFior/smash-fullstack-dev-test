import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_app/app/modules/home/domain/use_cases/use_cases.dart';
import 'package:smash_app/app/modules/home/presentation/pages/countries/countries_store.dart';

class CountriesController {
  final CountriesStore store;
  final GetCountriesUseCase getCountriesUseCase;

  CountriesController({
    required this.store,
    required this.getCountriesUseCase,
  });

  getCountries() async {
    try {
      store.data = store.listCountries = await getCountriesUseCase();
    } catch (e) {
      store.error = e.toString();
      store.data = store.listCountries = [];
    }
  }

  void onChangeSearchHeader(String value) {
    store.data = store.listCountries
        .where((country) => country.name.toLowerCase().contains(
              value.toLowerCase(),
            ))
        .toList();
  }

  navigateCitiesPage(String countryId) {
    Modular.to.pushNamed(
      "/cities",
      arguments: countryId,
    );
  }
}
