import 'package:countries_gql/domain/models/country.dart';
import 'package:flutter/material.dart';

class CountryList extends StatefulWidget {
  const CountryList({
    required this.countries,
    required this.onSelect,
    required this.onRefresh,
    required this.onLoadMore,
    Key? key,
  }) : super(key: key);

  final List<Country> countries;
  final Function(String) onSelect;
  final VoidCallback onRefresh;
  final VoidCallback onLoadMore;

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        widget.onLoadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => widget.onRefresh(),
      child: ListView.separated(
        controller: _controller,
        separatorBuilder: (_, __) => Divider(height: 0),
        itemCount: widget.countries.length,
        itemBuilder: (BuildContext context, int i) {
          Country c = widget.countries[i];
          return ListTile(
            onTap: () => widget.onSelect(c.id),
            leading: Text(
              c.emoji,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            title: Text(
              c.name,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          );
        },
      ),
    );
  }
}
