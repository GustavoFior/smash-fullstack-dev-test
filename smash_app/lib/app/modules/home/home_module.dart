import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_app/app/commons/commons.dart';
import 'package:smash_app/app/modules/home/domain/use_cases/use_cases.dart';
import 'package:smash_app/app/modules/home/presentation/pages/cities/cities_controller.dart';
import 'package:smash_app/app/modules/home/presentation/pages/cities/cities_page.dart';
import 'package:smash_app/app/modules/home/presentation/pages/cities/cities_store.dart';
import 'package:smash_app/app/modules/home/presentation/pages/countries/countries_controller.dart';
import 'package:smash_app/app/modules/home/presentation/pages/countries/countries_page.dart';
import 'package:smash_app/app/modules/home/presentation/pages/countries/countries_store.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        //Countries
        Bind.factory((i) => CountriesStore()),
        Bind.factory(
          (i) => CountriesController(
            store: i(),
            getCountriesUseCase: i(),
          ),
        ),
        Bind.factory(
          (i) => FirebaseFirestoreRepositoryImpl(
            firestore: i(),
          ),
        ),
        Bind.factory(
          (i) => GetCountriesUseCaseImpl(
            repository: i(),
          ),
        ),
        // Cities
        Bind.factory((i) => CitiesStore()),
        Bind.factory(
          (i) => CitiesController(
            getCitiesUseCase: i(),
            store: i(),
          ),
        ),
        Bind.factory(
          (i) => GetCitiesUseCaseImpl(
            repository: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const CountriesPage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/cities',
          child: (context, args) => CitiesPage(
            countryId: args.data,
          ),
          transition: TransitionType.noTransition,
        ),
      ];
}
