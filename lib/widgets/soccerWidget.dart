import 'package:flutter/material.dart';
import 'package:hello_movies/models/soccer.dart';

class SoccerWidget extends StatelessWidget {
  final List<Soccer> soccers;

  SoccerWidget({this.soccers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: soccers.length,
        itemBuilder: (context, index) {
          final soccer = soccers[index];

          return ListTile(
              title: Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(soccer.judul), Text(soccer.deskripsi)],
                  ),
                ),
              )
            ],
          ));
        });
  }
}
