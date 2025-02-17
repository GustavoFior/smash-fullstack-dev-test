import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:smash_app/app/modules/home/presentation/models/search_list_model.dart';
import 'package:smash_app/app/modules/home/presentation/widgets/search_header.dart';
import 'package:smash_app/app/modules/home/presentation/widgets/search_list.dart';

import 'countries_controller.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  final _controller = Modular.get<CountriesController>();

  @override
  void initState() {
    _controller.getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Country'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: SearchHeader(
                      count: _controller.store.data?.length ?? 0,
                      onChanged: (value) {
                        _controller.onChangeSearchHeader(value);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _controller.store.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final country = _controller.store.data?[index];
                        return SearchList(
                          model: SearchListModel(
                            id: country?.id ?? "",
                            name: country?.name ?? "",
                          ),
                          onChanged: () => _controller
                              .navigateCitiesPage((country?.id ?? "")),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
