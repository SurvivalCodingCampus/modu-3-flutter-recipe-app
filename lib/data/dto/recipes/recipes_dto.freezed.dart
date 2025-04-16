// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipes_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipesDto {

@JsonKey(name: 'recipes') List<Recipes>? get recipes;
/// Create a copy of RecipesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipesDtoCopyWith<RecipesDto> get copyWith => _$RecipesDtoCopyWithImpl<RecipesDto>(this as RecipesDto, _$identity);

  /// Serializes this RecipesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipesDto&&const DeepCollectionEquality().equals(other.recipes, recipes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recipes));

@override
String toString() {
  return 'RecipesDto(recipes: $recipes)';
}


}

/// @nodoc
abstract mixin class $RecipesDtoCopyWith<$Res>  {
  factory $RecipesDtoCopyWith(RecipesDto value, $Res Function(RecipesDto) _then) = _$RecipesDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'recipes') List<Recipes>? recipes
});




}
/// @nodoc
class _$RecipesDtoCopyWithImpl<$Res>
    implements $RecipesDtoCopyWith<$Res> {
  _$RecipesDtoCopyWithImpl(this._self, this._then);

  final RecipesDto _self;
  final $Res Function(RecipesDto) _then;

/// Create a copy of RecipesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipes = freezed,}) {
  return _then(_self.copyWith(
recipes: freezed == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipes>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RecipesDto implements RecipesDto {
  const _RecipesDto({@JsonKey(name: 'recipes') final  List<Recipes>? recipes}): _recipes = recipes;
  factory _RecipesDto.fromJson(Map<String, dynamic> json) => _$RecipesDtoFromJson(json);

 final  List<Recipes>? _recipes;
@override@JsonKey(name: 'recipes') List<Recipes>? get recipes {
  final value = _recipes;
  if (value == null) return null;
  if (_recipes is EqualUnmodifiableListView) return _recipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RecipesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipesDtoCopyWith<_RecipesDto> get copyWith => __$RecipesDtoCopyWithImpl<_RecipesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipesDto&&const DeepCollectionEquality().equals(other._recipes, _recipes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recipes));

@override
String toString() {
  return 'RecipesDto(recipes: $recipes)';
}


}

/// @nodoc
abstract mixin class _$RecipesDtoCopyWith<$Res> implements $RecipesDtoCopyWith<$Res> {
  factory _$RecipesDtoCopyWith(_RecipesDto value, $Res Function(_RecipesDto) _then) = __$RecipesDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'recipes') List<Recipes>? recipes
});




}
/// @nodoc
class __$RecipesDtoCopyWithImpl<$Res>
    implements _$RecipesDtoCopyWith<$Res> {
  __$RecipesDtoCopyWithImpl(this._self, this._then);

  final _RecipesDto _self;
  final $Res Function(_RecipesDto) _then;

/// Create a copy of RecipesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipes = freezed,}) {
  return _then(_RecipesDto(
recipes: freezed == recipes ? _self._recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipes>?,
  ));
}


}


/// @nodoc
mixin _$Recipes {

@JsonKey(name: 'category') String? get category;@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'image') String? get image;@JsonKey(name: 'chef') String? get chef;@JsonKey(name: 'time') String? get time;@JsonKey(name: 'rating') double? get rating;@JsonKey(name: 'ingredients') List<Ingredients>? get ingredients;
/// Create a copy of Recipes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipesCopyWith<Recipes> get copyWith => _$RecipesCopyWithImpl<Recipes>(this as Recipes, _$identity);

  /// Serializes this Recipes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipes&&(identical(other.category, category) || other.category == category)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.chef, chef) || other.chef == chef)&&(identical(other.time, time) || other.time == time)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other.ingredients, ingredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,id,name,image,chef,time,rating,const DeepCollectionEquality().hash(ingredients));

@override
String toString() {
  return 'Recipes(category: $category, id: $id, name: $name, image: $image, chef: $chef, time: $time, rating: $rating, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class $RecipesCopyWith<$Res>  {
  factory $RecipesCopyWith(Recipes value, $Res Function(Recipes) _then) = _$RecipesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'category') String? category,@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'image') String? image,@JsonKey(name: 'chef') String? chef,@JsonKey(name: 'time') String? time,@JsonKey(name: 'rating') double? rating,@JsonKey(name: 'ingredients') List<Ingredients>? ingredients
});




}
/// @nodoc
class _$RecipesCopyWithImpl<$Res>
    implements $RecipesCopyWith<$Res> {
  _$RecipesCopyWithImpl(this._self, this._then);

  final Recipes _self;
  final $Res Function(Recipes) _then;

/// Create a copy of Recipes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = freezed,Object? id = freezed,Object? name = freezed,Object? image = freezed,Object? chef = freezed,Object? time = freezed,Object? rating = freezed,Object? ingredients = freezed,}) {
  return _then(_self.copyWith(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,chef: freezed == chef ? _self.chef : chef // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,ingredients: freezed == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredients>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Recipes implements Recipes {
  const _Recipes({@JsonKey(name: 'category') this.category, @JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'image') this.image, @JsonKey(name: 'chef') this.chef, @JsonKey(name: 'time') this.time, @JsonKey(name: 'rating') this.rating, @JsonKey(name: 'ingredients') final  List<Ingredients>? ingredients}): _ingredients = ingredients;
  factory _Recipes.fromJson(Map<String, dynamic> json) => _$RecipesFromJson(json);

@override@JsonKey(name: 'category') final  String? category;
@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'image') final  String? image;
@override@JsonKey(name: 'chef') final  String? chef;
@override@JsonKey(name: 'time') final  String? time;
@override@JsonKey(name: 'rating') final  double? rating;
 final  List<Ingredients>? _ingredients;
@override@JsonKey(name: 'ingredients') List<Ingredients>? get ingredients {
  final value = _ingredients;
  if (value == null) return null;
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Recipes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipesCopyWith<_Recipes> get copyWith => __$RecipesCopyWithImpl<_Recipes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipes&&(identical(other.category, category) || other.category == category)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.chef, chef) || other.chef == chef)&&(identical(other.time, time) || other.time == time)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,id,name,image,chef,time,rating,const DeepCollectionEquality().hash(_ingredients));

@override
String toString() {
  return 'Recipes(category: $category, id: $id, name: $name, image: $image, chef: $chef, time: $time, rating: $rating, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$RecipesCopyWith<$Res> implements $RecipesCopyWith<$Res> {
  factory _$RecipesCopyWith(_Recipes value, $Res Function(_Recipes) _then) = __$RecipesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'category') String? category,@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'image') String? image,@JsonKey(name: 'chef') String? chef,@JsonKey(name: 'time') String? time,@JsonKey(name: 'rating') double? rating,@JsonKey(name: 'ingredients') List<Ingredients>? ingredients
});




}
/// @nodoc
class __$RecipesCopyWithImpl<$Res>
    implements _$RecipesCopyWith<$Res> {
  __$RecipesCopyWithImpl(this._self, this._then);

  final _Recipes _self;
  final $Res Function(_Recipes) _then;

/// Create a copy of Recipes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = freezed,Object? id = freezed,Object? name = freezed,Object? image = freezed,Object? chef = freezed,Object? time = freezed,Object? rating = freezed,Object? ingredients = freezed,}) {
  return _then(_Recipes(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,chef: freezed == chef ? _self.chef : chef // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,ingredients: freezed == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredients>?,
  ));
}


}


/// @nodoc
mixin _$Ingredients {

@JsonKey(name: 'ingredient') Ingredient? get ingredient;@JsonKey(name: 'amount') int? get amount;
/// Create a copy of Ingredients
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientsCopyWith<Ingredients> get copyWith => _$IngredientsCopyWithImpl<Ingredients>(this as Ingredients, _$identity);

  /// Serializes this Ingredients to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ingredients&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredient,amount);

@override
String toString() {
  return 'Ingredients(ingredient: $ingredient, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $IngredientsCopyWith<$Res>  {
  factory $IngredientsCopyWith(Ingredients value, $Res Function(Ingredients) _then) = _$IngredientsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ingredient') Ingredient? ingredient,@JsonKey(name: 'amount') int? amount
});


$IngredientCopyWith<$Res>? get ingredient;

}
/// @nodoc
class _$IngredientsCopyWithImpl<$Res>
    implements $IngredientsCopyWith<$Res> {
  _$IngredientsCopyWithImpl(this._self, this._then);

  final Ingredients _self;
  final $Res Function(Ingredients) _then;

/// Create a copy of Ingredients
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredient = freezed,Object? amount = freezed,}) {
  return _then(_self.copyWith(
ingredient: freezed == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as Ingredient?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Ingredients
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientCopyWith<$Res>? get ingredient {
    if (_self.ingredient == null) {
    return null;
  }

  return $IngredientCopyWith<$Res>(_self.ingredient!, (value) {
    return _then(_self.copyWith(ingredient: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Ingredients implements Ingredients {
  const _Ingredients({@JsonKey(name: 'ingredient') this.ingredient, @JsonKey(name: 'amount') this.amount});
  factory _Ingredients.fromJson(Map<String, dynamic> json) => _$IngredientsFromJson(json);

@override@JsonKey(name: 'ingredient') final  Ingredient? ingredient;
@override@JsonKey(name: 'amount') final  int? amount;

/// Create a copy of Ingredients
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientsCopyWith<_Ingredients> get copyWith => __$IngredientsCopyWithImpl<_Ingredients>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ingredients&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredient,amount);

@override
String toString() {
  return 'Ingredients(ingredient: $ingredient, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$IngredientsCopyWith<$Res> implements $IngredientsCopyWith<$Res> {
  factory _$IngredientsCopyWith(_Ingredients value, $Res Function(_Ingredients) _then) = __$IngredientsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ingredient') Ingredient? ingredient,@JsonKey(name: 'amount') int? amount
});


@override $IngredientCopyWith<$Res>? get ingredient;

}
/// @nodoc
class __$IngredientsCopyWithImpl<$Res>
    implements _$IngredientsCopyWith<$Res> {
  __$IngredientsCopyWithImpl(this._self, this._then);

  final _Ingredients _self;
  final $Res Function(_Ingredients) _then;

/// Create a copy of Ingredients
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredient = freezed,Object? amount = freezed,}) {
  return _then(_Ingredients(
ingredient: freezed == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as Ingredient?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Ingredients
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientCopyWith<$Res>? get ingredient {
    if (_self.ingredient == null) {
    return null;
  }

  return $IngredientCopyWith<$Res>(_self.ingredient!, (value) {
    return _then(_self.copyWith(ingredient: value));
  });
}
}


/// @nodoc
mixin _$Ingredient {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'image') String? get image;
/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientCopyWith<Ingredient> get copyWith => _$IngredientCopyWithImpl<Ingredient>(this as Ingredient, _$identity);

  /// Serializes this Ingredient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ingredient&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image);

@override
String toString() {
  return 'Ingredient(id: $id, name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class $IngredientCopyWith<$Res>  {
  factory $IngredientCopyWith(Ingredient value, $Res Function(Ingredient) _then) = _$IngredientCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'image') String? image
});




}
/// @nodoc
class _$IngredientCopyWithImpl<$Res>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._self, this._then);

  final Ingredient _self;
  final $Res Function(Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? image = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Ingredient implements Ingredient {
  const _Ingredient({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'image') this.image});
  factory _Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'image') final  String? image;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientCopyWith<_Ingredient> get copyWith => __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ingredient&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image);

@override
String toString() {
  return 'Ingredient(id: $id, name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(_Ingredient value, $Res Function(_Ingredient) _then) = __$IngredientCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'image') String? image
});




}
/// @nodoc
class __$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(this._self, this._then);

  final _Ingredient _self;
  final $Res Function(_Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? image = freezed,}) {
  return _then(_Ingredient(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
