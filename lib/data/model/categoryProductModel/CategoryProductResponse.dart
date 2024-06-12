class CategoryProductResponse {
  int? currentPage;
  List<CategoryProduct>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  CategoryProductResponse(
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

  CategoryProductResponse.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <CategoryProduct>[];
      json['data'].forEach((v) {
        data!.add(new CategoryProduct.fromJson(v));
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

class CategoryProduct {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? typeId;
  dynamic price;
  dynamic shopId;
  dynamic salePrice;
  String? language;
  dynamic minPrice;
  dynamic maxPrice;
  String? sku;
  dynamic quantity;
  dynamic inStock;
  dynamic isTaxable;
  dynamic shippingClassId;
  String? status;
  String? productType;
  String? unit;
  dynamic height;
  dynamic width;
  dynamic length;
  Image1? image;
  dynamic video;
  //List<Gallery>? gallery;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  dynamic authorId;
  dynamic manufacturerId;
  dynamic isDigital;
  dynamic isExternal;
  dynamic externalProductUrl;
  dynamic externalProductButtonText;
  List<dynamic>? blockedDates;
  dynamic ratings;
  dynamic totalReviews;
  List<RatingCount>? ratingCount;
  dynamic myReview;
  bool? inWishlist;
  List<String>? translatedLanguages;

  CategoryProduct(
      {this.id,
        this.name,
        this.slug,
        this.description,
        this.typeId,
        this.price,
        this.shopId,
        this.salePrice,
        this.language,
        this.minPrice,
        this.maxPrice,
        this.sku,
        this.quantity,
        this.inStock,
        this.isTaxable,
        this.shippingClassId,
        this.status,
        this.productType,
        this.unit,
        this.height,
        this.width,
        this.length,
        this.image,
        this.video,
        //this.gallery,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.authorId,
        this.manufacturerId,
        this.isDigital,
        this.isExternal,
        this.externalProductUrl,
        this.externalProductButtonText,
        this.blockedDates,
        this.ratings,
        this.totalReviews,
        this.ratingCount,
        this.myReview,
        this.inWishlist,
        this.translatedLanguages});

  CategoryProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    typeId = json['type_id'];
    price = json['price'];
    shopId = json['shop_id'];
    salePrice = json['sale_price'];
    language = json['language'];
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
    sku = json['sku'];
    quantity = json['quantity'];
    inStock = json['in_stock'];
    isTaxable = json['is_taxable'];
    shippingClassId = json['shipping_class_id'];
    status = json['status'];
    productType = json['product_type'];
    unit = json['unit'];
    height = json['height'];
    width = json['width'];
    length = json['length'];
    image = json['image'] != null ? new Image1.fromJson(json['image']) : null;
    video = json['video'];
    // if (json['gallery'] != null) {
    //   gallery = <Gallery>[];
    //   json['gallery'].forEach((v) {
    //     gallery!.add(new Gallery.fromJson(v));
    //   });
    // }
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    authorId = json['author_id'];
    manufacturerId = json['manufacturer_id'];
    isDigital = json['is_digital'];
    isExternal = json['is_external'];
    externalProductUrl = json['external_product_url'];
    externalProductButtonText = json['external_product_button_text'];
    // if (json['blocked_dates'] != null) {
    //   blockedDates = <Null>[];
    //   json['blocked_dates'].forEach((v) {
    //     blockedDates!.add(new Null.fromJson(v));
    //   });
    // }
    ratings = json['ratings'];
    totalReviews = json['total_reviews'];
    if (json['rating_count'] != null) {
      ratingCount = <RatingCount>[];
      json['rating_count'].forEach((v) {
        ratingCount!.add(new RatingCount.fromJson(v));
      });
    }
    myReview = json['my_review'];
    inWishlist = json['in_wishlist'];
    translatedLanguages = json['translated_languages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['type_id'] = this.typeId;
    data['price'] = this.price;
    data['shop_id'] = this.shopId;
    data['sale_price'] = this.salePrice;
    data['language'] = this.language;
    data['min_price'] = this.minPrice;
    data['max_price'] = this.maxPrice;
    data['sku'] = this.sku;
    data['quantity'] = this.quantity;
    data['in_stock'] = this.inStock;
    data['is_taxable'] = this.isTaxable;
    data['shipping_class_id'] = this.shippingClassId;
    data['status'] = this.status;
    data['product_type'] = this.productType;
    data['unit'] = this.unit;
    data['height'] = this.height;
    data['width'] = this.width;
    data['length'] = this.length;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['video'] = this.video;
    // if (this.gallery != null) {
    //   data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    // }
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['author_id'] = this.authorId;
    data['manufacturer_id'] = this.manufacturerId;
    data['is_digital'] = this.isDigital;
    data['is_external'] = this.isExternal;
    data['external_product_url'] = this.externalProductUrl;
    data['external_product_button_text'] = this.externalProductButtonText;
    if (this.blockedDates != null) {
      data['blocked_dates'] =
          this.blockedDates!.map((v) => v.toJson()).toList();
    }
    data['ratings'] = this.ratings;
    data['total_reviews'] = this.totalReviews;
    if (this.ratingCount != null) {
      data['rating_count'] = this.ratingCount!.map((v) => v.toJson()).toList();
    }
    data['my_review'] = this.myReview;
    data['in_wishlist'] = this.inWishlist;
    data['translated_languages'] = this.translatedLanguages;
    return data;
  }
}

class Image1 {
  dynamic id;
  String? original;
  String? thumbnail;

  Image1({this.id, this.original, this.thumbnail});

  Image1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    original = json['original'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['original'] = this.original;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class RatingCount {
  int? rating;
  int? total;
  int? positiveFeedbacksCount;
  int? negativeFeedbacksCount;
  dynamic myFeedback;
  int? abusiveReportsCount;

  RatingCount(
      {this.rating,
        this.total,
        this.positiveFeedbacksCount,
        this.negativeFeedbacksCount,
        this.myFeedback,
        this.abusiveReportsCount});

  RatingCount.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    total = json['total'];
    positiveFeedbacksCount = json['positive_feedbacks_count'];
    negativeFeedbacksCount = json['negative_feedbacks_count'];
    myFeedback = json['my_feedback'];
    abusiveReportsCount = json['abusive_reports_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['total'] = this.total;
    data['positive_feedbacks_count'] = this.positiveFeedbacksCount;
    data['negative_feedbacks_count'] = this.negativeFeedbacksCount;
    data['my_feedback'] = this.myFeedback;
    data['abusive_reports_count'] = this.abusiveReportsCount;
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