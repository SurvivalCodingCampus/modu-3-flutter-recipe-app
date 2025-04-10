// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get name; String get userId; String get email; String get password; String get address; String get introduction; String get job; Set<User> get followingUsers; Set<User> get followerUsers;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.name, name) || other.name == name)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.address, address) || other.address == address)&&(identical(other.introduction, introduction) || other.introduction == introduction)&&(identical(other.job, job) || other.job == job)&&const DeepCollectionEquality().equals(other.followingUsers, followingUsers)&&const DeepCollectionEquality().equals(other.followerUsers, followerUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,userId,email,password,address,introduction,job,const DeepCollectionEquality().hash(followingUsers),const DeepCollectionEquality().hash(followerUsers));

@override
String toString() {
  return 'User(name: $name, userId: $userId, email: $email, password: $password, address: $address, introduction: $introduction, job: $job, followingUsers: $followingUsers, followerUsers: $followerUsers)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String name, String userId, String email, String password, String address, String introduction, String job, Set<User> followingUsers, Set<User> followerUsers
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? userId = null,Object? email = null,Object? password = null,Object? address = null,Object? introduction = null,Object? job = null,Object? followingUsers = null,Object? followerUsers = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,introduction: null == introduction ? _self.introduction : introduction // ignore: cast_nullable_to_non_nullable
as String,job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String,followingUsers: null == followingUsers ? _self.followingUsers : followingUsers // ignore: cast_nullable_to_non_nullable
as Set<User>,followerUsers: null == followerUsers ? _self.followerUsers : followerUsers // ignore: cast_nullable_to_non_nullable
as Set<User>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({this.name = '', this.userId = '', this.email = '', this.password = '', this.address = '', this.introduction = '', this.job = '', final  Set<User> followingUsers = const {}, final  Set<User> followerUsers = const {}}): _followingUsers = followingUsers,_followerUsers = followerUsers;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String userId;
@override@JsonKey() final  String email;
@override@JsonKey() final  String password;
@override@JsonKey() final  String address;
@override@JsonKey() final  String introduction;
@override@JsonKey() final  String job;
 final  Set<User> _followingUsers;
@override@JsonKey() Set<User> get followingUsers {
  if (_followingUsers is EqualUnmodifiableSetView) return _followingUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_followingUsers);
}

 final  Set<User> _followerUsers;
@override@JsonKey() Set<User> get followerUsers {
  if (_followerUsers is EqualUnmodifiableSetView) return _followerUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_followerUsers);
}


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.name, name) || other.name == name)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.address, address) || other.address == address)&&(identical(other.introduction, introduction) || other.introduction == introduction)&&(identical(other.job, job) || other.job == job)&&const DeepCollectionEquality().equals(other._followingUsers, _followingUsers)&&const DeepCollectionEquality().equals(other._followerUsers, _followerUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,userId,email,password,address,introduction,job,const DeepCollectionEquality().hash(_followingUsers),const DeepCollectionEquality().hash(_followerUsers));

@override
String toString() {
  return 'User(name: $name, userId: $userId, email: $email, password: $password, address: $address, introduction: $introduction, job: $job, followingUsers: $followingUsers, followerUsers: $followerUsers)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String name, String userId, String email, String password, String address, String introduction, String job, Set<User> followingUsers, Set<User> followerUsers
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? userId = null,Object? email = null,Object? password = null,Object? address = null,Object? introduction = null,Object? job = null,Object? followingUsers = null,Object? followerUsers = null,}) {
  return _then(_User(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,introduction: null == introduction ? _self.introduction : introduction // ignore: cast_nullable_to_non_nullable
as String,job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String,followingUsers: null == followingUsers ? _self._followingUsers : followingUsers // ignore: cast_nullable_to_non_nullable
as Set<User>,followerUsers: null == followerUsers ? _self._followerUsers : followerUsers // ignore: cast_nullable_to_non_nullable
as Set<User>,
  ));
}


}

// dart format on
