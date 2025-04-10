import 'package:flutter/material.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key});

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _stars = 0;

  Widget _buildStar(int starCount) {
    return InkWell(
      child: Icon(
        Icons.star,
        // size: 30.0,
        color: _stars >= starCount ? Colors.orange : Colors.grey,
      ),
      onTap: () {
        setState(() {
          _stars = starCount;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          () => showDialog(
            context: context,
            builder:
                (BuildContext context) => AlertDialog(
                  title: Center(child: Text('Rate this post')),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildStar(1),
                      _buildStar(2),
                      _buildStar(3),
                      _buildStar(4),
                      _buildStar(5),
                    ],
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: Navigator.of(context).pop,
                      child: Text('CANCEL'),
                    ),
                  ],
                ),
          ),
      child: Text('give rate'),
    );
  }
}
