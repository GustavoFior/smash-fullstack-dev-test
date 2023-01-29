import 'package:smash_app/app/commons/commons.dart';
import 'package:smash_app/app/modules/home/commons/constants.dart';
import 'package:smash_app/app/modules/home/domain/entities/entities.dart';

abstract class GetCountriesUseCase {
  Future<List<CountryEntity>> call();
}

class GetCountriesUseCaseImpl implements GetCountriesUseCase {
  final FirebaseFirestoreRepository repository;

  GetCountriesUseCaseImpl({
    required this.repository,
  });

  @override
  Future<List<CountryEntity>> call() async {
    var result = await repository.getCollection(kFirebaseCollectionCountries);
    return result.docs.map((doc) {
      return CountryEntity(
        id: doc.id,
        name: doc.data()['name'] ?? "",
      );
    }).toList();
  }
}
