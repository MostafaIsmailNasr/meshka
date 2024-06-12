class BrandsResponse {
  int? id;
  String? name;
  String? slug;
  String? language;
  String? icon;
  List<PromotionalSliders>? promotionalSliders;
  String? createdAt;
  String? updatedAt;

  BrandsResponse(
      {this.id,
        this.name,
        this.slug,
        this.language,
        this.icon,
        this.promotionalSliders,
        this.createdAt,
        this.updatedAt,});

  BrandsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    language = json['language'];
    icon = json['icon'];
    if (json['promotional_sliders'] != null) {
      promotionalSliders = <PromotionalSliders>[];
      json['promotional_sliders'].forEach((v) {
        promotionalSliders!.add(new PromotionalSliders.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['language'] = this.language;
    data['icon'] = this.icon;
    if (this.promotionalSliders != null) {
      data['promotional_sliders'] =
          this.promotionalSliders!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PromotionalSliders {
  String? thumbnail;
  String? original;
  int? id;

  PromotionalSliders({this.thumbnail, this.original, this.id});

  PromotionalSliders.fromJson(Map<String, dynamic> json) {
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