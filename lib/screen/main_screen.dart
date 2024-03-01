import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ulkeler/data/countries_api.dart';
import 'package:ulkeler/models/ulke.dart';
import 'package:ulkeler/screen/countries_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulkeler/screen/fav_countries_screen.dart';
import 'package:ulkeler/widgets/country_list_widget.dart';

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<Ulke> _ulkeler = [];

  List<String> _favCountries = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _favSee().then((value) {
      countriesGet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _builAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _builAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              _goFavorites();
            },
            icon: Icon(Icons.favorite_sharp))
      ],
      title: Text("Tüm ülkeler"),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return _ulkeler.isEmpty
        ? Center(child: CircularProgressIndicator())
        : CountriesList(_ulkeler, _favCountries);
  }

  void countriesGet() async {
    CountriesApi.fetchCountries().then((value) {
      setState(() {
        Iterable list = jsonDecode(value.body);
        this._ulkeler = list.map((ulkeler) => Ulke.fromJson(ulkeler)).toList();
      });
    });
  }

  void _goFavorites() {
    MaterialPageRoute countriesFavRoute = MaterialPageRoute(builder: (context) {
      return FavCountries(_ulkeler, _favCountries);
    });
    Navigator.push(context, countriesFavRoute);
  }

  Future<void> _favSee() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? fav = prefs.getStringList("fav");
    if (fav != null) {
      for (String countrieCode in fav) {
        _favCountries.add(countrieCode);
      }

      setState(() {});
    }
  }
}
