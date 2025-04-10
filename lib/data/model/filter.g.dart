// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Filter _$FilterFromJson(Map<String, dynamic> json) => _Filter(
  time: $enumDecodeNullable(_$TimeEnumMap, json['time']) ?? Time.all,
  rate: $enumDecodeNullable(_$RateEnumMap, json['rate']) ?? Rate.star1,
  category:
      $enumDecodeNullable(_$CategoryEnumMap, json['category']) ?? Category.all,
);

Map<String, dynamic> _$FilterToJson(_Filter instance) => <String, dynamic>{
  'time': _$TimeEnumMap[instance.time]!,
  'rate': _$RateEnumMap[instance.rate]!,
  'category': _$CategoryEnumMap[instance.category]!,
};

const _$TimeEnumMap = {
  Time.all: 'all',
  Time.newest: 'newest',
  Time.oldest: 'oldest',
  Time.popularity: 'popularity',
};

const _$RateEnumMap = {
  Rate.star1: 'star1',
  Rate.star2: 'star2',
  Rate.star3: 'star3',
  Rate.star4: 'star4',
  Rate.star5: 'star5',
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
