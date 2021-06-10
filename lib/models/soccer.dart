class Soccer {
  final String judul;
  final String deskripsi;

  Soccer({this.judul, this.deskripsi});

  factory Soccer.fromJson(Map<String, dynamic> json) {
    return Soccer(judul: json["judul"], deskripsi: json["deskripsi"]);
  }
}
