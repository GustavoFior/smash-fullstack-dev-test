import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:smash_app/app/modules/home/presentation/models/search_list_model.dart';
import 'package:smash_app/app/modules/home/presentation/widgets/search_header.dart';
import 'package:smash_app/app/modules/home/presentation/widgets/search_list.dart';

import 'cities_controller.dart';

class CitiesPage extends StatefulWidget {
  final String countryId;

  const CitiesPage({
    super.key,
    required this.countryId,
  });

  @override
  State<CitiesPage> createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  final _controller = Modular.get<CitiesController>();

  @override
  void initState() {
    _controller.getCities(countryId: widget.countryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('City'),
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
                        final city = _controller.store.data?[index];
                        return SearchList(
                          model: SearchListModel(
                            id: city?.cityId ?? "",
                            name: city?.name ?? "",
                            state: city?.state ?? "",
                          ),
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
