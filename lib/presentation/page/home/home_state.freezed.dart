// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 List<Recipe> get searchData; List<String> get categoryList; List<Recipe> get categoryFilterRecipeList; double get imageWidth; double get imageHeight; String get selectCategory;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.searchData, searchData)&&const DeepCollectionEquality().equals(other.categoryList, categoryList)&&const DeepCollectionEquality().equals(other.categoryFilterRecipeList, categoryFilterRecipeList)&&(identical(other.imageWidth, imageWidth) || other.imageWidth == imageWidth)&&(identical(other.imageHeight, imageHeight) || other.imageHeight == imageHeight)&&(identical(other.selectCategory, selectCategory) || other.selectCategory == selectCategory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(searchData),const DeepCollectionEquality().hash(categoryList),const DeepCollectionEquality().hash(categoryFilterRecipeList),imageWidth,imageHeight,selectCategory);

@override
String toString() {
  return 'HomeState(searchData: $searchData, categoryList: $categoryList, categoryFilterRecipeList: $categoryFilterRecipeList, imageWidth: $imageWidth, imageHeight: $imageHeight, selectCategory: $selectCategory)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<Recipe> searchData, double imageWidth, double imageHeight, String selectCategory, List<String> categoryList, List<Recipe> categoryFilterRecipeList
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchData = null,Object? imageWidth = null,Object? imageHeight = null,Object? selectCategory = null,Object? categoryList = null,Object? categoryFilterRecipeList = null,}) {
  return _then(HomeState(
searchData: null == searchData ? _self.searchData : searchData // ignore: cast_nullable_to_non_nullable
as List<Recipe>,imageWidth: null == imageWidth ? _self.imageWidth : imageWidth // ignore: cast_nullable_to_non_nullable
as double,imageHeight: null == imageHeight ? _self.imageHeight : imageHeight // ignore: cast_nullable_to_non_nullable
as double,selectCategory: null == selectCategory ? _self.selectCategory : selectCategory // ignore: cast_nullable_to_non_nullable
as String,categoryList: null == categoryList ? _self.categoryList : categoryList // ignore: cast_nullable_to_non_nullable
as List<String>,categoryFilterRecipeList: null == categoryFilterRecipeList ? _self.categoryFilterRecipeList : categoryFilterRecipeList // ignore: cast_nullable_to_non_nullable
as List<Recipe>,
  ));
}

}


// dart format on
