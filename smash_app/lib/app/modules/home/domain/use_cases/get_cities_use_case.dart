import 'package:smash_app/app/commons/commons.dart';
import 'package:smash_app/app/modules/home/commons/constants.dart';
import 'package:smash_app/app/modules/home/domain/entities/entities.dart';

abstract class GetCitiesUseCase {
  Future<List<CityEntity>> call({
    required String countryId,
  });
}

class GetCitiesUseCaseImpl implements GetCitiesUseCase {
  final FirebaseFirestoreRepository repository;

  GetCitiesUseCaseImpl({
    required this.repository,
  });

  @override
  Future<List<CityEntity>> call({
    required String countryId,
  }) async {
    var docResult =
        await repository.getDocument(kFirebaseCollectionCountries, countryId);
    var result = await docResult.collection(kFirebaseCollectionCities).get();

    return result.docs.map((doc) {
      return CityEntity(
        cityId: doc.id,
        name: doc.data()['name'] ?? "",
        state: doc.data()['state'] ?? "",
      );
    }).toList();
  }
}
