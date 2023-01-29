import 'package:get/get.dart';

abstract class StateStore<T> {
  final Rx<T?> _data = Rx<T?>(null);
  final Rx<String?> _error = Rx<String?>(null);

  Rx<String?> get errorRx => _error;
  String? get error => _error.value;

  T? get data => _data.value;
  Rx<T?> get rxData => _data;

  set error(String? value) => _error.value = value;
  set data(T? value) => _data.value = value;
}
