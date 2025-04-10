// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  name: json['name'] as String? ?? '',
  userId: json['userId'] as String? ?? '',
  email: json['email'] as String? ?? '',
  password: json['password'] as String? ?? '',
  address: json['address'] as String? ?? '',
  introduction: json['introduction'] as String? ?? '',
  job: json['job'] as String? ?? '',
  followingUsers:
      (json['followingUsers'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toSet() ??
      const {},
  followerUsers:
      (json['followerUsers'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toSet() ??
      const {},
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'name': instance.name,
  'userId': instance.userId,
  'email': instance.email,
  'password': instance.password,
  'address': instance.address,
  'introduction': instance.introduction,
  'job': instance.job,
  'followingUsers': instance.followingUsers.toList(),
  'followerUsers': instance.followerUsers.toList(),
};
