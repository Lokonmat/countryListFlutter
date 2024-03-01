import 'package:flutter/material.dart';
import 'package:ulkeler/models/ulke.dart';
import 'package:ulkeler/widgets/build_detail_row_widget.dart';

class CountriesDetail extends StatelessWidget {
  final Ulke _ulke;

  CountriesDetail(this._ulke);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_ulke.isim),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 32,
        ),
        _buildFlag(context),
        SizedBox(
          height: 24,
        ),
        _buildName(),
        SizedBox(
          height: 24,
        ),
        _buildAllDetails(),
      ],
    );
  }

  Widget _buildFlag(BuildContext context) {
    return Image.network(
      _ulke.bayrak,
      width: MediaQuery.sizeOf(context).width / 2,
      fit: BoxFit.fitWidth,
    );
  }

  Widget _buildName() {
    return Text(
      _ulke.isim,
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildDetailRow(String baslik, String detail) {
    return BuildDetailRow(
      baslik: baslik,
      detail: detail,
    );
  }

  Widget _buildAllDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Column(
        children: [
          _buildDetailRow("Ülke İsmi: ", _ulke.isim),
          _buildDetailRow("Başkent: ", _ulke.baskent),
          _buildDetailRow("Bölge: ", _ulke.bolge),
          _buildDetailRow("Nüfus: ", _ulke.nufus.toString()),
          _buildDetailRow("Dil: ", _ulke.dil),
        ],
      ),
    );
  }
}
