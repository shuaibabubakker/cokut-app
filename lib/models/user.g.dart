// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    name: json['name'] as String,
    email: json['email'] as String,
    uid: json['uid'] as String,
    phone: json['phone'] as String,
    address: (json['address'] as List)
        ?.map((e) =>
            e == null ? null : Address.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    registered: json['registered'] as bool,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'uid': instance.uid,
      'phone': instance.phone,
      'address': instance.address,
      'registered': instance.registered,
    };

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    adl1: json['adl1'] as String,
    adl2: json['adl2'] as String,
    adl3: json['adl3'] as String,
    zone: json['zone'] as String,
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'adl1': instance.adl1,
      'adl2': instance.adl2,
      'adl3': instance.adl3,
      'zone': instance.zone,
    };
