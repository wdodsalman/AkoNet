import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'arti.dart';

class ArtiModel {
  final List<Arti> arti;
  ArtiModel({
    required this.arti,
  });

  ArtiModel copyWith({
    List<Arti>? arti,
  }) {
    return ArtiModel(
      arti: arti ?? this.arti,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'arti': arti.map((x) => x.toMap()).toList(),
    };
  }

  factory ArtiModel.fromMap(Map<String, dynamic> map) {
    return ArtiModel(
      arti: List<Arti>.from(map['arti']?.map((x) => Arti.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtiModel.fromJson(String source) => ArtiModel.fromMap(json.decode(source));

  @override
  String toString() => 'ArtiModel(arti: $arti)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ArtiModel &&
      listEquals(other.arti, arti);
  }

  @override
  int get hashCode => arti.hashCode;
}