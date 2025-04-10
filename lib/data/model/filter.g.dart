// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Filter _$FilterFromJson(Map<String, dynamic> json) => _Filter(
  time: $enumDecodeNullable(_$TimeEnumMap, json['time']) ?? Time.all,
  rate: $enumDecodeNullable(_$RateEnumMap, json['rate']) ?? Rate.star1,
  category:
      $enumDecodeNullable(_$CategorysEnumMap, json['category']) ??
      Categorys.all,
);

Map<String, dynamic> _$FilterToJson(_Filter instance) => <String, dynamic>{
  'time': _$TimeEnumMap[instance.time]!,
  'rate': _$RateEnumMap[instance.rate]!,
  'category': _$CategorysEnumMap[instance.category]!,
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

const _$CategorysEnumMap = {
  Categorys.all: 'all',
  Categorys.cereal: 'cereal',
  Categorys.vegetables: 'vegetables',
  Categorys.dinner: 'dinner',
  Categorys.chinese: 'chinese',
  Categorys.localDish: 'localDish',
  Categorys.fruit: 'fruit',
  Categorys.breakfast: 'breakfast',
  Categorys.spanish: 'spanish',
  Categorys.lunch: 'lunch',
};
