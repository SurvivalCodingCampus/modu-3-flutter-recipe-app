// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_search_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterSearchState _$FilterSearchStateFromJson(Map<String, dynamic> json) =>
    FilterSearchState(
      time: $enumDecodeNullable(_$TimeEnumMap, json['time']) ?? Time.all,
      rate: (json['rate'] as num?)?.toInt() ?? 0,
      category:
          $enumDecodeNullable(_$CategoryEnumMap, json['category']) ??
          Category.all,
    );

Map<String, dynamic> _$FilterSearchStateToJson(FilterSearchState instance) =>
    <String, dynamic>{
      'time': _$TimeEnumMap[instance.time]!,
      'rate': instance.rate,
      'category': _$CategoryEnumMap[instance.category]!,
    };

const _$TimeEnumMap = {
  Time.all: 'all',
  Time.newest: 'newest',
  Time.oldest: 'oldest',
  Time.popularity: 'popularity',
};

const _$CategoryEnumMap = {
  Category.all: 'all',
  Category.cereal: 'cereal',
  Category.vegetables: 'vegetables',
  Category.dinner: 'dinner',
  Category.chinese: 'chinese',
  Category.localDish: 'localDish',
  Category.fruit: 'fruit',
  Category.breakfast: 'breakfast',
  Category.spanish: 'spanish',
  Category.lunch: 'lunch',
};
