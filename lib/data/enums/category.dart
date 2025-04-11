import 'package:freezed_annotation/freezed_annotation.dart';

enum Category {
  @JsonValue('Cereal')
  cereal,
  @JsonValue('Vegetables')
  vegetables,
  @JsonValue('Dinner')
  dinner,
  @JsonValue('Chinese')
  chinese,
  @JsonValue('Local Dish')
  localDish,
  @JsonValue('Fruit')
  fruit,
  @JsonValue('Break Fast')
  breakfast,
  @JsonValue('Spanish')
  spanish,
  @JsonValue('Lunch')
  lunch,
  @JsonValue('Indian')
  indian,
  @JsonValue('Italian')
  italian,
  @JsonValue('Asian')
  asian,
  @JsonValue('Japanese')
  japanese,
  @JsonValue('American')
  american,
  @JsonValue('British')
  british,
  @JsonValue('French')
  french,
  unknown,
}
