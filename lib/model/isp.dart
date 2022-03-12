import 'dart:convert';

class Isp {
  final String image;
  final String status;
  final String pings;
  final int paket;
  Isp({
    required this.image,
    required this.status,
    required this.pings,
    required this.paket,
  });

  Isp copyWith({
    String? image,
    String? status,
    String? pings,
    int? paket,
  }) {
    return Isp(
      image: image ?? this.image,
      status: status ?? this.status,
      pings: pings ?? this.pings,
      paket: paket ?? this.paket,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'status': status,
      'pings': pings,
      'paket': paket,
    };
  }

  factory Isp.fromMap(Map<String, dynamic> map) {
    return Isp(
      image: map['image'] ?? '',
      status: map['status'] ?? '',
      pings: map['pings'] ?? '',
      paket: map['paket']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Isp.fromJson(String source) => Isp.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Isp(image: $image, status: $status, pings: $pings, paket: $paket)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Isp &&
      other.image == image &&
      other.status == status &&
      other.pings == pings &&
      other.paket == paket;
  }

  @override
  int get hashCode {
    return image.hashCode ^
      status.hashCode ^
      pings.hashCode ^
      paket.hashCode;
  }
}