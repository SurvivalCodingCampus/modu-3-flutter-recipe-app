import 'package:flutter/material.dart';

import '../ui/color_styles.dart';
import '../ui/text_styles.dart';

class Buttons {
  final String name;

  const Buttons({required this.name});
}

class BigButtonsWidget extends StatefulWidget {
  final VoidCallback onClick;
  final Buttons buttons;

  const BigButtonsWidget({required this.onClick, required this.buttons});

  @override
  State<BigButtonsWidget> createState() => _BigButtonsWidgetState();
}

class _BigButtonsWidgetState extends State<BigButtonsWidget> {
  bool onChanged = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            onChanged = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            onChanged = false;
          });
          widget.onClick();
        },
        onTapCancel: () {
          setState(() {
            onChanged = false;
          });
        },
        child: Container(
          width: 315,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 85),
          decoration: BoxDecoration(
            color: onChanged ? ColorStyles.gray4 : ColorStyles.primary100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                widget.buttons.name,
                style: TextStyles.mediumTextBold.copyWith(color: Colors.white),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class MediumButtonsWidget extends StatefulWidget {
  final VoidCallback onClick;
  final Buttons buttons;

  const MediumButtonsWidget({required this.onClick, required this.buttons});

  @override
  State<MediumButtonsWidget> createState() => _MediumButtonsWidgetState();
}

class _MediumButtonsWidgetState extends State<MediumButtonsWidget> {
  bool onChanged = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            onChanged = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            onChanged = false;
          });
          widget.onClick();
        },
        onTapCancel: () {
          setState(() {
            onChanged = false;
          });
        },
        child: Container(
          width: 243,
          height: 54,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
            color: onChanged ? ColorStyles.gray4 : ColorStyles.primary100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.buttons.name,
                style: TextStyles.normalTextBold.copyWith(color: Colors.white),
              ),
              Spacer(),
              const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallButtonsWidget extends StatefulWidget {
  final VoidCallback onClick;
  final Buttons buttons;

  const SmallButtonsWidget({required this.onClick, required this.buttons});

  @override
  State<SmallButtonsWidget> createState() => _SmallButtonsWidgetState();
}

class _SmallButtonsWidgetState extends State<SmallButtonsWidget> {
  bool onChanged = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            onChanged = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            onChanged = false;
          });
          widget.onClick();
        },
        onTapCancel: () {
          setState(() {
            onChanged = false;
          });
        },
        child: Container(
          width: 174,
          height: 37,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: onChanged ? ColorStyles.gray4 : ColorStyles.primary100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                widget.buttons.name,
                style: TextStyles.smallerTextBold.copyWith(color: Colors.white),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
