import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'isp.dart';

class Akonet {
  final List<Isp> isp;
  Akonet({
    required this.isp,
  });

  Akonet copyWith({
    List<Isp>? isp,
  }) {
    return Akonet(
      isp: isp ?? this.isp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isp': isp.map((x) => x.toMap()).toList(),
    };
  }

  factory Akonet.fromMap(Map<String, dynamic> map) {
    return Akonet(
      isp: List<Isp>.from(map['isp']?.map((x) => Isp.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Akonet.fromJson(String source) => Akonet.fromMap(json.decode(source));

  @override
  String toString() => 'Akonet(isp: $isp)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Akonet &&
      listEquals(other.isp, isp);
  }

  @override
  int get hashCode => isp.hashCode;
}