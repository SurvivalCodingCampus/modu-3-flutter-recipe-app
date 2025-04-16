import 'package:flutter/material.dart';

import '../../data/model/procedure_model.dart';

class ProcedureList extends StatelessWidget {
  final List<Procedure> procedures;

  const ProcedureList({super.key, required this.procedures});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: procedures.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final step = procedures[index];

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${index + 1}. ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(child: Text(step.steps.join('\n'))),
            ],
          ),
        );
      },
    );
  }
}
