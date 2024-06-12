class ImageResponse {
  String? thumbnail;
  String? original;
  int? id;

  ImageResponse({this.thumbnail, this.original, this.id});

  ImageResponse.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    original = json['original'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['original'] = this.original;
    data['id'] = this.id;
    return data;
  }
}