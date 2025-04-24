import 'package:flutter/material.dart';

class AddPopup extends StatelessWidget {
  final void Function(String)? onSelected;
  final List<PopupMenuEntry<String>> items;

  const AddPopup({super.key, required this.onSelected, required this.items});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Image.asset('assets/images/more.png'),
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => items,
    );
  }
}
