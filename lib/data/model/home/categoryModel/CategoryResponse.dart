class CategoryResponse {
  int? currentPage;
  List<Category>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;

  CategoryResponse(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Category>[];
      json['data'].forEach((v) {
        data!.add(new Category.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? language;
  dynamic icon;
  Image1? image;
  String? details;
  int? showInHomePage;
  dynamic parent;
  int? typeId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic parentId;
  List<String>? translatedLanguages;
  Type? type;
  List<dynamic>? children;

  Category(
      {this.id,
        this.name,
        this.slug,
        this.language,
        this.icon,
        this.image,
        this.details,
        this.showInHomePage,
        this.parent,
        this.typeId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.parentId,
        this.translatedLanguages,
        this.type,
        this.children});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    language = json['language'];
    icon = json['icon'];
    image = json['image'] != null ? new Image1.fromJson(json['image']) : null;
    details = json['details'];
    showInHomePage = json['show_in_home_page'];
    parent = json['parent'];
    typeId = json['type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    parentId = json['parent_id'];
    translatedLanguages = json['translated_languages'].cast<String>();
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    if (json['children'] != null) {
      children = <Null>[];
      // json['children'].forEach((v) {
      //   children!.add(new Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['language'] = this.language;
    data['icon'] = this.icon;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['details'] = this.details;
    data['show_in_home_page'] = this.showInHomePage;
    data['parent'] = this.parent;
    data['type_id'] = this.typeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['parent_id'] = this.parentId;
    data['translated_languages'] = this.translatedLanguages;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Image1 {
  String? thumbnail;
  String? original;
  dynamic? id;

  Image1({this.thumbnail, this.original, this.id});

  Image1.fromJson(Map<String, dynamic> json) {
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

class Type {
  int? id;
  String? name;
  Settings? settings;
  String? slug;
  String? language;
  String? icon;
  List<Null>? promotionalSliders;
  String? createdAt;
  String? updatedAt;
  List<String>? translatedLanguages;

  Type(
      {this.id,
        this.name,
        this.settings,
        this.slug,
        this.language,
        this.icon,
        this.promotionalSliders,
        this.createdAt,
        this.updatedAt,
        this.translatedLanguages});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
    slug = json['slug'];
    language = json['language'];
    icon = json['icon'];
    if (json['promotional_sliders'] != null) {
      promotionalSliders = <Null>[];
      json['promotional_sliders'].forEach((v) {
        //promotionalSliders!.add(new Null.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    translatedLanguages = json['translated_languages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    data['slug'] = this.slug;
    data['language'] = this.language;
    data['icon'] = this.icon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['translated_languages'] = this.translatedLanguages;
    return data;
  }
}

class Settings {
  bool? isHome;
  String? layoutType;
  String? productCard;

  Settings({this.isHome, this.layoutType, this.productCard});

  Settings.fromJson(Map<String, dynamic> json) {
    isHome = json['isHome'];
    layoutType = json['layoutType'];
    productCard = json['productCard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isHome'] = this.isHome;
    data['layoutType'] = this.layoutType;
    data['productCard'] = this.productCard;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}