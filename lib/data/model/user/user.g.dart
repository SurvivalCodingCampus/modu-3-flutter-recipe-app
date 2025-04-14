// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  userId: json['userId'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  address: json['address'] as String,
  password: json['password'] as String?,
  imageUrl: json['imageUrl'] as String?,
  introduction: json['introduction'] as String?,
  job: json['job'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'name': instance.name,
  'email': instance.email,
  'password': instance.password,
  'address': instance.address,
  'imageUrl': instance.imageUrl,
  'introduction': instance.introduction,
  'job': instance.job,
};
