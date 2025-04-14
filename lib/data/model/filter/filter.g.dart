// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
  time: $enumDecode(_$TimeEnumMap, json['time']),
  rate: $enumDecode(_$RateEnumMap, json['rate']),
  category: $enumDecode(_$CategoryEnumMap, json['category']),
);

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
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
  Rate.one: 'one',
  Rate.two: 'two',
  Rate.three: 'three',
  Rate.four: 'four',
  Rate.five: 'five',
};

const _$CategoryEnumMap = {
  Category.cereal: 'cereal',
  Category.vegetables: 'vegetables',
  Category.dinner: 'dinner',
  Category.chiness: 'chiness',
  Category.localDish: 'localDish',
  Category.fruit: 'fruit',
  Category.breakfast: 'breakfast',
  Category.spanish: 'spanish',
  Category.lunch: 'lunch',
};
