import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingbarWidget extends StatefulWidget {
  const RatingbarWidget({super.key});

  @override
  State<RatingbarWidget> createState() => _RatingbarWidgetState();
}

class _RatingbarWidgetState extends State<RatingbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating Bar Demo'),
      ),
      body: Center(
          child: RatingBar.builder(
              itemCount: 5,
              initialRating: 1,
              direction: Axis.horizontal,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );

                  case 1:
                    return Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.greenAccent,
                    );
                  case 4:
                    return Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                  default:
                    return const Text("");
                }
              },
              onRatingUpdate: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Given Rating $value')));
              })),
    );
  }
}
