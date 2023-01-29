import 'package:smash_app/app/modules/home/domain/use_cases/get_cities_use_case.dart';
import 'package:smash_app/app/modules/home/presentation/pages/cities/cities_store.dart';

class CitiesController {
  final CitiesStore store;
  final GetCitiesUseCase getCitiesUseCase;

  CitiesController({
    required this.store,
    required this.getCitiesUseCase,
  });

  getCities({required String countryId}) async {
    try {
      store.data =
          store.listCities = await getCitiesUseCase(countryId: countryId);
    } catch (e) {
      store.error = e.toString();
      store.data = store.listCities = [];
    }
  }

  void onChangeSearchHeader(String value) {
    store.data = store.listCities
        .where((country) => country.name.toLowerCase().contains(
              value.toLowerCase(),
            ))
        .toList();
  }
}
