// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_recipes_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SavedRecipesAction _$SavedRecipesActionFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'fetchRecipes':
          return FetchRecipes.fromJson(
            json
          );
                case 'bookmarkRecipe':
          return BookmarkRecipe.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'SavedRecipesAction',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$SavedRecipesAction {



  /// Serializes this SavedRecipesAction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedRecipesAction);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SavedRecipesAction()';
}


}

/// @nodoc
class $SavedRecipesActionCopyWith<$Res>  {
$SavedRecipesActionCopyWith(SavedRecipesAction _, $Res Function(SavedRecipesAction) __);
}


/// @nodoc
@JsonSerializable()

class FetchRecipes implements SavedRecipesAction {
  const FetchRecipes({final  String? $type}): $type = $type ?? 'fetchRecipes';
  factory FetchRecipes.fromJson(Map<String, dynamic> json) => _$FetchRecipesFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$FetchRecipesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchRecipes);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SavedRecipesAction.fetchRecipes()';
}


}




/// @nodoc
@JsonSerializable()

class BookmarkRecipe implements SavedRecipesAction {
  const BookmarkRecipe(this.id, {final  String? $type}): $type = $type ?? 'bookmarkRecipe';
  factory BookmarkRecipe.fromJson(Map<String, dynamic> json) => _$BookmarkRecipeFromJson(json);

 final  int id;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of SavedRecipesAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkRecipeCopyWith<BookmarkRecipe> get copyWith => _$BookmarkRecipeCopyWithImpl<BookmarkRecipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkRecipeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkRecipe&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'SavedRecipesAction.bookmarkRecipe(id: $id)';
}


}

/// @nodoc
abstract mixin class $BookmarkRecipeCopyWith<$Res> implements $SavedRecipesActionCopyWith<$Res> {
  factory $BookmarkRecipeCopyWith(BookmarkRecipe value, $Res Function(BookmarkRecipe) _then) = _$BookmarkRecipeCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$BookmarkRecipeCopyWithImpl<$Res>
    implements $BookmarkRecipeCopyWith<$Res> {
  _$BookmarkRecipeCopyWithImpl(this._self, this._then);

  final BookmarkRecipe _self;
  final $Res Function(BookmarkRecipe) _then;

/// Create a copy of SavedRecipesAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(BookmarkRecipe(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
