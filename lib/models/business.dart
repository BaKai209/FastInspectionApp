// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Business {
  final int id;
  final String businessName;
  final String businessAddress;
  final String businessPhone;
  final String businessEmail;
  final String businessWebsite;
  final String imagePath;
  Business({
    required this.id,
    required this.businessName,
    required this.businessAddress,
    required this.businessPhone,
    required this.businessEmail,
    required this.businessWebsite,
    required this.imagePath,
  });

  Business copyWith({
    int? id,
    String? businessName,
    String? businessAddress,
    String? businessPhone,
    String? businessEmail,
    String? businessWebsite,
    String? imagePath,
  }) {
    return Business(
      id: id ?? this.id,
      businessName: businessName ?? this.businessName,
      businessAddress: businessAddress ?? this.businessAddress,
      businessPhone: businessPhone ?? this.businessPhone,
      businessEmail: businessEmail ?? this.businessEmail,
      businessWebsite: businessWebsite ?? this.businessWebsite,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'businessName': businessName,
      'businessAddress': businessAddress,
      'businessPhone': businessPhone,
      'businessEmail': businessEmail,
      'businessWebsite': businessWebsite,
      'imagePath': imagePath,
    };
  }

  factory Business.fromMap(Map<String, dynamic> map) {
    return Business(
      id: map['id'] as int,
      businessName: map['businessName'] as String,
      businessAddress: map['businessAddress'] as String,
      businessPhone: map['businessPhone'] as String,
      businessEmail: map['businessEmail'] as String,
      businessWebsite: map['businessWebsite'] as String,
      imagePath: map['imagePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Business.fromJson(String source) =>
      Business.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Business(id: $id, businessName: $businessName, businessAddress: $businessAddress, businessPhone: $businessPhone, businessEmail: $businessEmail, businessWebsite: $businessWebsite, imagePath: $imagePath)';
  }

  @override
  bool operator ==(covariant Business other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.businessName == businessName &&
        other.businessAddress == businessAddress &&
        other.businessPhone == businessPhone &&
        other.businessEmail == businessEmail &&
        other.businessWebsite == businessWebsite &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        businessName.hashCode ^
        businessAddress.hashCode ^
        businessPhone.hashCode ^
        businessEmail.hashCode ^
        businessWebsite.hashCode ^
        imagePath.hashCode;
  }
}
