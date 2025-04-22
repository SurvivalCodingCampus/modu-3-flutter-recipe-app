import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/steps/steps_data_source.dart';
import 'package:recipe_app/data/dto/step_dto.dart';

class StepsDataSourceImpl implements StepsDataSource {
  @override
  Future<List<StepDto>> getAllSteps() async {
    final jsonString = await rootBundle.loadString('assets/json/steps.json');
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    final List<dynamic> steps = jsonMap['steps'];

    return steps.map((e) => StepDto.fromJson(e)).toList();
  }

  @override
  Future<List<StepDto>> getStepsbyId(int recipeId) async {
    final jsonString = await rootBundle.loadString('assets/json/steps.json');
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    final List<dynamic> steps = jsonMap['steps'];

    return steps
        .where((element) => element['recipeId'] == recipeId)
        .map((e) => StepDto.fromJson(e))
        .toList();
  }
}
