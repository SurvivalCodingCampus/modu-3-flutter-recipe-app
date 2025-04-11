import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/components/f_small_button.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FRatingDialog extends StatefulWidget {
  final String title;
  final String actionName;
  final void Function(int) onChange;

  const FRatingDialog({
    super.key,
    required this.title,
    required this.actionName,
    required this.onChange,
  });

  @override
  State<FRatingDialog> createState() => _FRatingDialogState();
}

class _FRatingDialogState extends State<FRatingDialog> {
  int _selectedRating = 0;

  void _selectedRate(int index) {
    setState(() {
      _selectedRating = index + 1;
    });
  }

  void _resetRate() {
    setState(() {
      _selectedRating = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FSmallButton(
      text: widget.title,
      voidCallback: () {
        _resetRate();
        showDialog(
          context: context,
          barrierColor: const Color.fromRGBO(0, 0, 0, 0.3),
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, setDialogState) {
                return _buildDialogDetail(setDialogState, context);
              },
            );
          },
        );
      },
    );
  }

  // ======== Dialog Detail =========

  Widget _buildDialogDetail(StateSetter setDialogState, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: UnconstrainedBox(
        child: Container(
          width: 170,
          height: 91,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyles.smallerTextRegular(color: AppColors.black),
              ),
              const SizedBox(height: 5),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(5, (int index) => index).map((index) {
                      return _buildStarIcon(index, setDialogState);
                    }).toList(),
              ),
              const SizedBox(height: 5),
              _buildActionButton(_selectedRating != 0, context, setDialogState),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStarIcon(
    int index,
    void Function(void Function()) setDialogState,
  ) {
    return GestureDetector(
      onTap: () {
        setDialogState(() {
          _selectedRate(index);
        });
      },
      child: Icon(
        index < _selectedRating ? Icons.star : Icons.star_border,
        color: AppColors.rating,
        size: 20,
      ),
    );
  }

  Widget _buildActionButton(
    bool isSelected,
    BuildContext context,
    void Function(void Function()) setDialogState,
  ) {
    return GestureDetector(
      onTap: () {
        _tapActionButton(setDialogState);
      },
      child: IntrinsicWidth(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 61),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.rating : AppColors.gray4,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              widget.actionName,
              style: TextStyles.smallerTextRegular(
                color: isSelected ? AppColors.white : AppColors.primary80,
                fontSize: 8,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _tapActionButton(void Function(void Function()) setDialogState) {
    if (_selectedRating == 0) {
      return;
    }

    setDialogState(() {
      widget.onChange(_selectedRating);
      Navigator.pop(context);
    });
  }
}
