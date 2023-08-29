import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:signature/signature.dart';

part 'my_points.g.dart';

@JsonSerializable()
class MyPoint {
  /// constructor
  MyPoint(
      {required this.offsetx,
      required this.offsety,
      required this.type,
      required this.pressure});

  /// x and y value on 2D canvas
  double offsetx;

  double offsety;
 
  /// pressure that user applied
  double pressure;

  /// type of user display finger movement
  PointType type;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory MyPoint.fromJson(Map<String, dynamic> json) =>
      _$MyPointFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MyPointToJson(this);


  static String encode(List<MyPoint> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>((music) => music.toJson())
            .toList(),
      );

  static List<MyPoint> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<MyPoint>((item) => MyPoint.fromJson(item))
          .toList();
}
