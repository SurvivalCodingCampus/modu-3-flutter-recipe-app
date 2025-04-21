import 'package:flutter/material.dart';

class ScoreDialog extends StatefulWidget {
  final String title;
  final String actionName;
  final void Function(int) onChange;

  const ScoreDialog({
    super.key,
    required this.title,
    required this.actionName,
    required this.onChange,
  });

  @override
  State<ScoreDialog> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreDialog> {
  int _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black12)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final isSelected = index < _selectedRating;

              return IconButton(
                onPressed: () {
                  setState(() {
                    _selectedRating = index + 1;
                  });
                },
                icon: Icon(
                  Icons.star,
                  size: 36,
                  color: isSelected ? Colors.amber : Colors.white,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                iconSize: 36,
              );
            }),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 30,
            child: ElevatedButton(
              onPressed: _selectedRating > 0
                  ? () {
                      widget.onChange(_selectedRating);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _selectedRating > 0 ? Colors.amber : const Color(0xFFBDBDBD),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(widget.actionName),
            ),
          ),
        ],
      ),
    );
  }
}