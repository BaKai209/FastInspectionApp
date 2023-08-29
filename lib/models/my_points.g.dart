// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPoint _$MyPointFromJson(Map<String, dynamic> json) => MyPoint(
      offsetx: (json['offsetx'] as num).toDouble(),
      offsety: (json['offsety'] as num).toDouble(),
      type: $enumDecode(_$PointTypeEnumMap, json['type']),
      pressure: (json['pressure'] as num).toDouble(),
    );

Map<String, dynamic> _$MyPointToJson(MyPoint instance) => <String, dynamic>{
      'offsetx': instance.offsetx,
      'offsety': instance.offsety,
      'pressure': instance.pressure,
      'type': _$PointTypeEnumMap[instance.type]!,
    };

const _$PointTypeEnumMap = {
  PointType.tap: 'tap',
  PointType.move: 'move',
};
