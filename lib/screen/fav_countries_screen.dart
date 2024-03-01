import 'package:flutter/material.dart';
import 'package:ulkeler/models/ulke.dart';
import 'package:ulkeler/widgets/country_list_widget.dart';

class FavCountries extends StatefulWidget {
  final List<Ulke> _ulkeler;

  final List<String> _favCountries;

  FavCountries(this._ulkeler, this._favCountries);

  @override
  State<FavCountries> createState() => _FavCountriesState();
}

class _FavCountriesState extends State<FavCountries> {
  List<Ulke> _favUlkeler = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (Ulke ulke in widget._ulkeler) {
      if (widget._favCountries.contains(ulke.ulkeKodu)) {
        _favUlkeler.add(ulke);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoriler"),
        centerTitle: true,
      ),
      body: CountriesList(_favUlkeler, widget._favCountries),
    );
  }
}
