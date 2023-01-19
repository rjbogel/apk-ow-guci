import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class MakananModel {

  const MakananModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambar,
  });

  final int id;
  final String nama;
  final int harga;
  final String gambar;

  factory MakananModel.fromJson(Map<String,dynamic> json) => MakananModel(
    id: json['id'] as int,
    nama: json['nama'].toString(),
    harga: json['harga'] as int,
    gambar: json['gambar'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'harga': harga,
    'gambar': gambar
  };

  MakananModel clone() => MakananModel(
    id: id,
    nama: nama,
    harga: harga,
    gambar: gambar
  );


  MakananModel copyWith({
    int? id,
    String? nama,
    int? harga,
    String? gambar
  }) => MakananModel(
    id: id ?? this.id,
    nama: nama ?? this.nama,
    harga: harga ?? this.harga,
    gambar: gambar ?? this.gambar,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is MakananModel && id == other.id && nama == other.nama && harga == other.harga && gambar == other.gambar;

  @override
  int get hashCode => id.hashCode ^ nama.hashCode ^ harga.hashCode ^ gambar.hashCode;
}
