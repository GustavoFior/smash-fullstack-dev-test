import 'package:get/state_manager.dart';
import 'package:smash_app/app/commons/commons.dart';
import 'package:smash_app/app/modules/home/domain/entities/city_entity.dart';

class CitiesStore extends StateStore<List<CityEntity>> {
  final Rx<List<CityEntity>?> rxCities = Rx<List<CityEntity>?>([]);
  List<CityEntity> listCities = [];

  @override
  List<CityEntity>? get data => rxCities.value ?? [];
  @override
  set data(List<CityEntity>? value) => rxCities.value = value ?? [];
}
