import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

class HeaderWidget extends StatelessWidget {
  final double lat;
  final double lon;
  const HeaderWidget({Key? key, required this.lat, required this.lon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Placemark>(
        future: _getAddress(
            lat, lon), // a previously-obtained Future<String> or null
        builder:
            (BuildContext context, AsyncSnapshot<Placemark> snapshot) {
          if (snapshot.hasData) {
            debugPrint(snapshot.data.toString());
            final String locality = snapshot.data!.locality!;
            return _header(
              locality: locality,
            );
          }
          //if snapshot have no data then set from local database
          return const Center(child: CircularProgressIndicator(),);
        });
  }

  //get user current address
  Future<Placemark> _getAddress(lat, lon) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placeMark[0];
    return place;
  }

  Widget _myText(
          {required String text,
          double fontSize = 22,
          Color? color,
          double height = 1.0}) =>
      Container(
        margin: const EdgeInsets.only(left: 10, right: 20),
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, height: height, color: color, fontWeight: FontWeight.w400),
        ),
      );

  Widget _header({required String locality}) {
    String date = DateFormat("yMMMMd").format(DateTime.now());
    return ListTile(
      title: _myText(text: locality, height: 2),
      subtitle: _myText(
          text: date, height: 1.0, color: Colors.grey[700], fontSize: 14,),
    );
  }
}
