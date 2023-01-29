import 'package:flutter/material.dart';
import 'package:smash_app/app/modules/home/presentation/models/search_list_model.dart';

class SearchList extends StatefulWidget {
  final SearchListModel model;
  final void Function()? onChanged;

  const SearchList({
    required this.model,
    this.onChanged,
    super.key,
  });

  String get state =>
      (model.state ?? "").isNotEmpty ? "State: ${model.state}" : "";

  bool get ignoreTrailing => state.isNotEmpty;

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[100],
          border: Border.all(
            color: Colors.blueGrey,
          )),
      child: ListTile(
        title: Text(widget.model.name),
        subtitle: Text(widget.state),
        textColor: Colors.blue[900],
        trailing:
            widget.ignoreTrailing ? null : const Icon(Icons.arrow_forward_ios),
        onTap: () => widget.onChanged != null ? widget.onChanged!() : null,
      ),
    );
  }
}
