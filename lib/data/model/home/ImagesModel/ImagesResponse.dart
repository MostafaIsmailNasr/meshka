class ImagesResponse {
  int? id;
  int? themeId;
  String? title;
  String? slug;
  String? type;
  String? language;
  dynamic description;
  String? sectionName;
  Gallery2? image;
  int? active;
  String? createdAt;
  String? updatedAt;

  ImagesResponse(
      {this.id,
        this.themeId,
        this.title,
        this.slug,
        this.type,
        this.language,
        this.description,
        this.sectionName,
        this.image,
        this.active,
        this.createdAt,
        this.updatedAt});

  ImagesResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    themeId = json['theme_id'];
    title = json['title'];
    slug = json['slug'];
    type = json['type'];
    language = json['language'];
    description = json['description'];
    sectionName = json['section_name'];
    image = json['image'] != null ? new Gallery2.fromJson(json['image']) : null;
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['theme_id'] = this.themeId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['type'] = this.type;
    data['language'] = this.language;
    data['description'] = this.description;
    data['section_name'] = this.sectionName;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Gallery2 {
  String? thumbnail;
  String? original;
  int? id;
  String? fileName;

  Gallery2({this.thumbnail, this.original, this.id, this.fileName});

  Gallery2.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    original = json['original'];
    id = json['id'];
    fileName = json['file_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['original'] = this.original;
    data['id'] = this.id;
    data['file_name'] = this.fileName;
    return data;
  }
}