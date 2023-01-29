import 'package:flutter/material.dart';

class SearchHeader extends StatefulWidget {
  final void Function(String) onChanged;
  final int count;

  const SearchHeader({
    required this.onChanged,
    required this.count,
    super.key,
  });

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Pesquisar por país',
        helperText: 'Quantidade de países encontrados: ${widget.count}',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        isDense: true,
        contentPadding: EdgeInsets.zero,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
          ),
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
