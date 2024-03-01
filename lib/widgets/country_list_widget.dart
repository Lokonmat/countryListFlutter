import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulkeler/models/ulke.dart';
import 'package:ulkeler/screen/countries_details_screen.dart';

class CountriesList extends StatefulWidget {
  List<Ulke> _ulkeler = [];

  List<String> _favCountries = [];

  CountriesList(this._ulkeler, this._favCountries);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildListItem,
      itemCount: widget._ulkeler.length,
    );
  }

  Widget? _buildListItem(BuildContext context, int index) {
    Ulke ulke = widget._ulkeler[index];
    return Card(
      child: ListTile(
          title: Text(ulke.isim),
          subtitle: Text("Başkent: ${ulke.baskent}"),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(ulke.bayrak),
          ),
          trailing: IconButton(
            icon: Icon(
              widget._favCountries.contains(ulke.ulkeKodu)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              _favClick(ulke);
            },
          ),
          onTap: () {
            _goDetails(context, ulke);
          }),
    );
  }

  void _favClick(Ulke ulke) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (widget._favCountries.contains(ulke.ulkeKodu)) {
      widget._favCountries.remove(ulke.ulkeKodu);
    } else {
      widget._favCountries.add(ulke.ulkeKodu);
    }

    await prefs.setStringList(("fav"), widget._favCountries);
    setState(() {});
  }

  void _goDetails(BuildContext context, Ulke ulke) {
    MaterialPageRoute countriesDetailRoute =
        MaterialPageRoute(builder: (context) {
      return CountriesDetail(ulke);
    });
    Navigator.push(context, countriesDetailRoute);
  }
}
