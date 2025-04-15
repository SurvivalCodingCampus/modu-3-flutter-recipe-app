import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';

class TabBars extends StatefulWidget {
  final List<String> labels;
  final List<Widget>? views;

  const TabBars({super.key, required this.labels, this.views});

  @override
  _TabBarsState createState() => _TabBarsState();
}

class _TabBarsState extends State<TabBars> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.labels.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          tabs: widget.labels.map((label) => Tab(text: label)).toList(),
          indicatorColor: ColorStyles.primary100,
          labelColor: ColorStyles.primary100,
          unselectedLabelColor: Colors.grey,
        ),
        Expanded(
          child:
              widget.views == null
                  ? const SizedBox() // 또는 CircularProgressIndicator(), Text("아직 데이터 없음") 등
                  : TabBarView(
                    controller: tabController,
                    children: widget.views!,
                  ),
        ),
      ],
    );
  }
}
