class ProductDetailsResponse {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? typeId;
  dynamic price;
  int? shopId;
  dynamic salePrice;
  String? language;
  int? minPrice;
  int? maxPrice;
  dynamic sku;
  int? quantity;
  int? inStock;
  int? isTaxable;
  dynamic shippingClassId;
  String? status;
  String? productType;
  String? unit;
  dynamic height;
  dynamic width;
  dynamic length;
  Image2? image;
  dynamic video;
  List<Gallery>? gallery;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  int? authorId;
  int? manufacturerId;
  int? isDigital;
  int? isExternal;
  dynamic externalProductUrl;
  dynamic externalProductButtonText;
  //List<Null>? blockedDates;
  //int? ratings;
  int? totalReviews;
  //List<Null>? ratingCount;
  dynamic myReview;
  bool? inWishlist;
  List<String>? translatedLanguages;
  List<Categories>? categories;
  List<Variations>? variations;
  List<VariationOptions>? variationOptions;
  List<RelatedProducts>? relatedProducts;

  ProductDetailsResponse(
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
        this.gallery,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.authorId,
        this.manufacturerId,
        this.isDigital,
        this.isExternal,
        this.externalProductUrl,
        this.externalProductButtonText,
        //this.blockedDates,
        //this.ratings,
        this.totalReviews,
       // this.ratingCount,
        this.myReview,
        this.inWishlist,
        this.translatedLanguages,
        this.categories,
        this.variations,
        this.variationOptions,
        this.relatedProducts});

  ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
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
    image = json['image'] != null ? new Image2.fromJson(json['image']) : null;
    video = json['video'];
    if (json['gallery'] != null) {
      //gallery = <Null>[];
      json['gallery'].forEach((v) {
        gallery?.add(new Gallery.fromJson(v));
      });
    }
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
    //ratings = json['ratings'];
    totalReviews = json['total_reviews'];
    // if (json['rating_count'] != null) {
    //   ratingCount = <Null>[];
    //   json['rating_count'].forEach((v) {
    //     ratingCount!.add(new Null.fromJson(v));
    //   });
    // }
    myReview = json['my_review'];
    inWishlist = json['in_wishlist'];
    translatedLanguages = json['translated_languages'].cast<String>();
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
    if (json['variation_options'] != null) {
      variationOptions = <VariationOptions>[];
      json['variation_options'].forEach((v) {
        variationOptions!.add(new VariationOptions.fromJson(v));
      });
    }
    if (json['related_products'] != null) {
      relatedProducts = <RelatedProducts>[];
      json['related_products'].forEach((v) {
        relatedProducts!.add(new RelatedProducts.fromJson(v));
      });
    }
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
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['author_id'] = this.authorId;
    data['manufacturer_id'] = this.manufacturerId;
    data['is_digital'] = this.isDigital;
    data['is_external'] = this.isExternal;
    data['external_product_url'] = this.externalProductUrl;
    data['external_product_button_text'] = this.externalProductButtonText;
    // if (this.blockedDates != null) {
    //   data['blocked_dates'] =
    //       this.blockedDates!.map((v) => v.toJson()).toList();
    // }
    // data['ratings'] = this.ratings;
    data['total_reviews'] = this.totalReviews;
    // if (this.ratingCount != null) {
    //   data['rating_count'] = this.ratingCount!.map((v) => v.toJson()).toList();
    // }
    data['my_review'] = this.myReview;
    data['in_wishlist'] = this.inWishlist;
    data['translated_languages'] = this.translatedLanguages;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    if (this.variationOptions != null) {
      data['variation_options'] =
          this.variationOptions!.map((v) => v.toJson()).toList();
    }
    if (this.relatedProducts != null) {
      data['related_products'] =
          this.relatedProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Image2 {
  int? id;
  String? original;
  String? thumbnail;

  Image2({this.id, this.original, this.thumbnail});

  Image2.fromJson(Map<String, dynamic> json) {
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

class Categories {
  int? id;
  String? name;
  String? slug;
  String? language;
  dynamic icon;
  Image2? image;
  String? details;
  int? showInHomePage;
  dynamic parent;
  int? typeId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic parentId;
  List<String>? translatedLanguages;
  Pivot? pivot;

  Categories(
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
        this.pivot});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    language = json['language'];
    icon = json['icon'];
    image = json['image'] != null ? new Image2.fromJson(json['image']) : null;
    details = json['details'];
    showInHomePage = json['show_in_home_page'];
    parent = json['parent'];
    typeId = json['type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    parentId = json['parent_id'];
    translatedLanguages = json['translated_languages'].cast<String>();
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
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
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? productId;
  int? categoryId;

  Pivot({this.productId, this.categoryId});

  Pivot.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    // data['category_id'] = this.categoryId;
    return data;
  }
}

class Variations {
  int? id;
  String? slug;
  int? attributeId;
  String? value;
  String? language;
  dynamic meta;
  String? createdAt;
  String? updatedAt;
  List<String>? translatedLanguages;
  Pivot? pivot;
  Attribute? attribute;

  Variations(
      {this.id,
        this.slug,
        this.attributeId,
        this.value,
        this.language,
        this.meta,
        this.createdAt,
        this.updatedAt,
        this.translatedLanguages,
        this.pivot,
        this.attribute});

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    attributeId = json['attribute_id'];
    value = json['value'];
    language = json['language'];
    meta = json['meta'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    translatedLanguages = json['translated_languages'].cast<String>();
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    attribute = json['attribute'] != null
        ? new Attribute.fromJson(json['attribute'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['attribute_id'] = this.attributeId;
    data['value'] = this.value;
    data['language'] = this.language;
    data['meta'] = this.meta;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['translated_languages'] = this.translatedLanguages;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.attribute != null) {
      data['attribute'] = this.attribute!.toJson();
    }
    return data;
  }
}

class Pivot2 {
  int? productId;
  int? attributeValueId;

  Pivot2({this.productId, this.attributeValueId});

  Pivot2.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    attributeValueId = json['attribute_value_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['attribute_value_id'] = this.attributeValueId;
    return data;
  }
}

class Attribute {
  int? id;
  String? slug;
  String? language;
  String? name;
  int? shopId;
  String? createdAt;
  String? updatedAt;
  List<String>? translatedLanguages;
  List<Values>? values;

  Attribute(
      {this.id,
        this.slug,
        this.language,
        this.name,
        this.shopId,
        this.createdAt,
        this.updatedAt,
        this.translatedLanguages,
        this.values});

  Attribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    language = json['language'];
    name = json['name'];
    shopId = json['shop_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    translatedLanguages = json['translated_languages'].cast<String>();
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['language'] = this.language;
    data['name'] = this.name;
    data['shop_id'] = this.shopId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['translated_languages'] = this.translatedLanguages;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  int? id;
  String? slug;
  int? attributeId;
  String? value;
  String? language;
  dynamic meta;
  String? createdAt;
  String? updatedAt;
  List<String>? translatedLanguages;

  Values(
      {this.id,
        this.slug,
        this.attributeId,
        this.value,
        this.language,
        this.meta,
        this.createdAt,
        this.updatedAt,
        this.translatedLanguages});

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    attributeId = json['attribute_id'];
    value = json['value'];
    language = json['language'];
    meta = json['meta'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    translatedLanguages = json['translated_languages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['attribute_id'] = this.attributeId;
    data['value'] = this.value;
    data['language'] = this.language;
    data['meta'] = this.meta;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['translated_languages'] = this.translatedLanguages;
    return data;
  }
}

class VariationOptions {
  int? id;
  String? title;
  dynamic image;
  String? price;
  dynamic salePrice;
  String? language;
  int? quantity;
  int? isDisable;
  String? sku;
  List<Options>? options;
  int? productId;
  String? createdAt;
  String? updatedAt;
  int? isDigital;
  //List<Null>? blockedDates;

  VariationOptions(
      {this.id,
        this.title,
        this.image,
        this.price,
        this.salePrice,
        this.language,
        this.quantity,
        this.isDisable,
        this.sku,
        this.options,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.isDigital,
       // this.blockedDates
      });

  VariationOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    salePrice = json['sale_price'];
    language = json['language'];
    quantity = json['quantity'];
    isDisable = json['is_disable'];
    sku = json['sku'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isDigital = json['is_digital'];
    // if (json['blocked_dates'] != null) {
    //   blockedDates = <Null>[];
    //   json['blocked_dates'].forEach((v) {
    //     blockedDates!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['price'] = this.price;
    data['sale_price'] = this.salePrice;
    data['language'] = this.language;
    data['quantity'] = this.quantity;
    data['is_disable'] = this.isDisable;
    data['sku'] = this.sku;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_digital'] = this.isDigital;
    // if (this.blockedDates != null) {
    //   data['blocked_dates'] =
    //       this.blockedDates!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Options {
  String? name;
  String? value;

  Options({this.name, this.value});

  Options.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class RelatedProducts {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? typeId;
  int? price;
  int? shopId;
  int? salePrice;
  String? language;
  int? minPrice;
  int? maxPrice;
  String? sku;
  int? quantity;
  int? inStock;
  int? isTaxable;
  dynamic shippingClassId;
  String? status;
  String? productType;
  String? unit;
  dynamic height;
  dynamic width;
  dynamic length;
  Image2? image;
  //List<Null>? video;
  List<Gallery>? gallery;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  int? authorId;
  int? manufacturerId;
  int? isDigital;
  int? isExternal;
  dynamic externalProductUrl;
  dynamic externalProductButtonText;
  //List<Null>? blockedDates;
  // int? ratings;
  int? totalReviews;
  //List<Null>? ratingCount;
  dynamic myReview;
  bool? inWishlist;
  List<String>? translatedLanguages;
  List<Categories>? categories;
  List<Variations>? variations;
  List<VariationOptions>? variationOptions;
  Type? type;

  RelatedProducts(
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
        //this.video,
        this.gallery,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.authorId,
        this.manufacturerId,
        this.isDigital,
        this.isExternal,
        this.externalProductUrl,
        this.externalProductButtonText,
        //this.blockedDates,
        // this.ratings,
        this.totalReviews,
        //this.ratingCount,
        this.myReview,
        this.inWishlist,
        this.translatedLanguages,
        this.categories,
        this.variations,
        this.variationOptions,
        this.type});

  RelatedProducts.fromJson(Map<String, dynamic> json) {
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
    image = json['image'] != null ? new Image2.fromJson(json['image']) : null;
    // if (json['video'] != null) {
    //   video = <Null>[];
    //   json['video'].forEach((v) {
    //     video!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['gallery'] != null) {
      //gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery?.add(new Gallery.fromJson(v));
      });
    }
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
    // ratings = json['ratings'];
    totalReviews = json['total_reviews'];
    // if (json['rating_count'] != null) {
    //   ratingCount = <Null>[];
    //   json['rating_count'].forEach((v) {
    //     ratingCount!.add(new Null.fromJson(v));
    //   });
    // }
    myReview = json['my_review'];
    inWishlist = json['in_wishlist'];
    translatedLanguages = json['translated_languages'].cast<String>();
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
    if (json['variation_options'] != null) {
      variationOptions = <VariationOptions>[];
      json['variation_options'].forEach((v) {
        variationOptions!.add(new VariationOptions.fromJson(v));
      });
    }
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
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
    // if (this.video != null) {
    //   data['video'] = this.video!.map((v) => v.toJson()).toList();
    // }
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['author_id'] = this.authorId;
    data['manufacturer_id'] = this.manufacturerId;
    data['is_digital'] = this.isDigital;
    data['is_external'] = this.isExternal;
    data['external_product_url'] = this.externalProductUrl;
    data['external_product_button_text'] = this.externalProductButtonText;
    // if (this.blockedDates != null) {
    //   data['blocked_dates'] =
    //       this.blockedDates!.map((v) => v.toJson()).toList();
    // }
    // data['ratings'] = this.ratings;
    data['total_reviews'] = this.totalReviews;
    // if (this.ratingCount != null) {
    //   data['rating_count'] = this.ratingCount!.map((v) => v.toJson()).toList();
    // }
    data['my_review'] = this.myReview;
    data['in_wishlist'] = this.inWishlist;
    data['translated_languages'] = this.translatedLanguages;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    if (this.variationOptions != null) {
      data['variation_options'] =
          this.variationOptions!.map((v) => v.toJson()).toList();
    }
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}

class Gallery {
  int? id;
  String? original;
  String? thumbnail;
  String? fileName;

  Gallery({this.id, this.original, this.thumbnail, this.fileName});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    original = json['original'];
    thumbnail = json['thumbnail'];
    fileName = json['file_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['original'] = this.original;
    data['thumbnail'] = this.thumbnail;
    data['file_name'] = this.fileName;
    return data;
  }
}

class VariationOptions2 {
  int? id;
  String? title;
  dynamic image;
  String? price;
  String? salePrice;
  String? language;
  int? quantity;
  int? isDisable;
  String? sku;
  List<Options>? options;
  int? productId;
  String? createdAt;
  String? updatedAt;
  int? isDigital;
  //List<Null>? blockedDates;

  VariationOptions2(
      {this.id,
        this.title,
        this.image,
        this.price,
        this.salePrice,
        this.language,
        this.quantity,
        this.isDisable,
        this.sku,
        this.options,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.isDigital,
        //this.blockedDates
      });

  VariationOptions2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    salePrice = json['sale_price'];
    language = json['language'];
    quantity = json['quantity'];
    isDisable = json['is_disable'];
    sku = json['sku'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isDigital = json['is_digital'];
    // if (json['blocked_dates'] != null) {
    //   blockedDates = <Null>[];
    //   json['blocked_dates'].forEach((v) {
    //     blockedDates!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['price'] = this.price;
    data['sale_price'] = this.salePrice;
    data['language'] = this.language;
    data['quantity'] = this.quantity;
    data['is_disable'] = this.isDisable;
    data['sku'] = this.sku;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_digital'] = this.isDigital;
    // if (this.blockedDates != null) {
    //   data['blocked_dates'] =
    //       this.blockedDates!.map((v) => v.toJson()).toList();
    // }
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
  //List<PromotionalSliders>? promotionalSliders;
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
        //this.promotionalSliders,
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
    // if (json['promotional_sliders'] != null) {
    //   promotionalSliders = <PromotionalSliders>[];
    //   json['promotional_sliders'].forEach((v) {
    //     promotionalSliders!.add(new PromotionalSliders.fromJson(v));
    //   });
    // }
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
    // if (this.promotionalSliders != null) {
    //   data['promotional_sliders'] =
    //       this.promotionalSliders!.map((v) => v.toJson()).toList();
    // }
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