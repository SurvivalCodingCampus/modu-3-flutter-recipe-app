// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Recipe {

 int get id; String get title; Picture get picture; double get rate; int get cookingTime; String get chef; List<Ingredients> get ingredients;
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCopyWith<Recipe> get copyWith => _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.picture, picture) || other.picture == picture)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.cookingTime, cookingTime) || other.cookingTime == cookingTime)&&(identical(other.chef, chef) || other.chef == chef)&&const DeepCollectionEquality().equals(other.ingredients, ingredients));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,picture,rate,cookingTime,chef,const DeepCollectionEquality().hash(ingredients));

@override
String toString() {
  return 'Recipe(id: $id, title: $title, picture: $picture, rate: $rate, cookingTime: $cookingTime, chef: $chef, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res>  {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) = _$RecipeCopyWithImpl;
@useResult
$Res call({
 int id, String title, Picture picture, double rate, int cookingTime, String chef, List<Ingredients> ingredients
});




}
/// @nodoc
class _$RecipeCopyWithImpl<$Res>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? picture = null,Object? rate = null,Object? cookingTime = null,Object? chef = null,Object? ingredients = null,}) {
  return _then(Recipe(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as Picture,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,cookingTime: null == cookingTime ? _self.cookingTime : cookingTime // ignore: cast_nullable_to_non_nullable
as int,chef: null == chef ? _self.chef : chef // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredients>,
  ));
}

}


// dart format on
