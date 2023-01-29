import 'package:get/state_manager.dart';
import 'package:smash_app/app/commons/commons.dart';
import 'package:smash_app/app/modules/home/domain/entities/country_entity.dart';

class CountriesStore extends StateStore<List<CountryEntity>> {
  final Rx<List<CountryEntity>?> rxCountries = Rx<List<CountryEntity>?>([]);
  List<CountryEntity> listCountries = [];

  @override
  List<CountryEntity>? get data => rxCountries.value ?? [];
  @override
  set data(List<CountryEntity>? value) => rxCountries.value = value ?? [];
}
