class SettingResponse {
  int? id;
  Options? options;
  String? language;
  String? createdAt;
  String? updatedAt;

  SettingResponse(
      {this.id, this.options, this.language, this.createdAt, this.updatedAt});

  SettingResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    options =
    json['options'] != null ? new Options.fromJson(json['options']) : null;
    language = json['language'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.options != null) {
      data['options'] = this.options!.toJson();
    }
    data['language'] = this.language;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Options {
  List<DeliveryTime>? deliveryTime;
  int? freeShippingAmount;
  int? minimumOrderAmount;
  int? maximumQuestionLimit;
  CurrencyOptions? currencyOptions;
  String? currency;
  Seo? seo;
  dynamic logo;
  bool? useAi;
  bool? useOtp;
  SmsEvent? smsEvent;
  int? taxClass;
  String? defaultAi;
  String? siteTitle;
  ServerInfo? serverInfo;
  bool? freeShipping;
  int? signupPoints;
  String? siteSubtitle;
  bool? useGoogleMap;
  bool? guestCheckout;
  int? shippingClass;
  bool? stripeCardOnly;
  ContactDetails? contactDetails;
  List<PaymentGateway>? paymentGateway;
  bool? isProductReview;
  int? maxShopDistance;
  bool? useEnableGateway;
  bool? useCashOnDelivery;
  bool? useMustVerifyEmail;
  int? currencyToWalletRatio;
  String? defaultPaymentGateway;
  String? defaultTheme;
  String? cardStyle;
  double? taxAmount;
  FaqCover? faqCover;
  FaqCover? contactUsCover;
  FaqCover? profileCover;

  Options(
      {this.deliveryTime,
        this.freeShippingAmount,
        this.minimumOrderAmount,
        this.maximumQuestionLimit,
        this.currencyOptions,
        this.currency,
        this.seo,
        this.logo,
        this.useAi,
        this.useOtp,
        this.smsEvent,
        this.taxClass,
        this.defaultAi,
        this.siteTitle,
        this.serverInfo,
        this.freeShipping,
        this.signupPoints,
        this.siteSubtitle,
        this.useGoogleMap,
        this.guestCheckout,
        this.shippingClass,
        this.stripeCardOnly,
        this.contactDetails,
        this.paymentGateway,
        this.isProductReview,
        this.maxShopDistance,
        this.useEnableGateway,
        this.useCashOnDelivery,
        this.useMustVerifyEmail,
        this.currencyToWalletRatio,
        this.defaultPaymentGateway,
        this.defaultTheme,
        this.cardStyle,
        this.taxAmount,
        this.faqCover,
        this.contactUsCover,
        this.profileCover});

  Options.fromJson(Map<String, dynamic> json) {
    if (json['deliveryTime'] != null) {
      deliveryTime = <DeliveryTime>[];
      json['deliveryTime'].forEach((v) {
        deliveryTime!.add(new DeliveryTime.fromJson(v));
      });
    }
    freeShippingAmount = json['freeShippingAmount'];
    minimumOrderAmount = json['minimumOrderAmount'];
    maximumQuestionLimit = json['maximumQuestionLimit'];
    currencyOptions = json['currencyOptions'] != null
        ? new CurrencyOptions.fromJson(json['currencyOptions'])
        : null;
    currency = json['currency'];
    seo = json['seo'] != null ? new Seo.fromJson(json['seo']) : null;
    logo = json['logo'];
    useAi = json['useAi'];
    useOtp = json['useOtp'];
    smsEvent = json['smsEvent'] != null
        ? new SmsEvent.fromJson(json['smsEvent'])
        : null;
    taxClass = json['taxClass'];
    defaultAi = json['defaultAi'];
    siteTitle = json['siteTitle'];
    serverInfo = json['server_info'] != null
        ? new ServerInfo.fromJson(json['server_info'])
        : null;
    freeShipping = json['freeShipping'];
    signupPoints = json['signupPoints'];
    siteSubtitle = json['siteSubtitle'];
    useGoogleMap = json['useGoogleMap'];
    guestCheckout = json['guestCheckout'];
    shippingClass = json['shippingClass'];
    stripeCardOnly = json['StripeCardOnly'];
    contactDetails = json['contactDetails'] != null
        ? new ContactDetails.fromJson(json['contactDetails'])
        : null;
    if (json['paymentGateway'] != null) {
      paymentGateway = <PaymentGateway>[];
      json['paymentGateway'].forEach((v) {
        paymentGateway!.add(new PaymentGateway.fromJson(v));
      });
    }
    isProductReview = json['isProductReview'];
    maxShopDistance = json['maxShopDistance'];
    useEnableGateway = json['useEnableGateway'];
    useCashOnDelivery = json['useCashOnDelivery'];
    useMustVerifyEmail = json['useMustVerifyEmail'];
    currencyToWalletRatio = json['currencyToWalletRatio'];
    defaultPaymentGateway = json['defaultPaymentGateway'];
    defaultTheme = json['defaultTheme'];
    cardStyle = json['cardStyle'];
    taxAmount = json['taxAmount'];
    faqCover = json['faqCover'] != null
        ? new FaqCover.fromJson(json['faqCover'])
        : null;
    contactUsCover = json['contactUsCover'] != null
        ? new FaqCover.fromJson(json['contactUsCover'])
        : null;
    profileCover = json['profileCover'] != null
        ? new FaqCover.fromJson(json['profileCover'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deliveryTime != null) {
      data['deliveryTime'] = this.deliveryTime!.map((v) => v.toJson()).toList();
    }
    data['freeShippingAmount'] = this.freeShippingAmount;
    data['minimumOrderAmount'] = this.minimumOrderAmount;
    data['maximumQuestionLimit'] = this.maximumQuestionLimit;
    if (this.currencyOptions != null) {
      data['currencyOptions'] = this.currencyOptions!.toJson();
    }
    data['currency'] = this.currency;
    if (this.seo != null) {
      data['seo'] = this.seo!.toJson();
    }
    data['logo'] = this.logo;
    data['useAi'] = this.useAi;
    data['useOtp'] = this.useOtp;
    if (this.smsEvent != null) {
      data['smsEvent'] = this.smsEvent!.toJson();
    }
    data['taxClass'] = this.taxClass;
    data['defaultAi'] = this.defaultAi;
    data['siteTitle'] = this.siteTitle;
    if (this.serverInfo != null) {
      data['server_info'] = this.serverInfo!.toJson();
    }
    data['freeShipping'] = this.freeShipping;
    data['signupPoints'] = this.signupPoints;
    data['siteSubtitle'] = this.siteSubtitle;
    data['useGoogleMap'] = this.useGoogleMap;
    data['guestCheckout'] = this.guestCheckout;
    data['shippingClass'] = this.shippingClass;
    data['StripeCardOnly'] = this.stripeCardOnly;
    if (this.contactDetails != null) {
      data['contactDetails'] = this.contactDetails!.toJson();
    }
    if (this.paymentGateway != null) {
      data['paymentGateway'] =
          this.paymentGateway!.map((v) => v.toJson()).toList();
    }
    data['isProductReview'] = this.isProductReview;
    data['maxShopDistance'] = this.maxShopDistance;
    data['useEnableGateway'] = this.useEnableGateway;
    data['useCashOnDelivery'] = this.useCashOnDelivery;
    data['useMustVerifyEmail'] = this.useMustVerifyEmail;
    data['currencyToWalletRatio'] = this.currencyToWalletRatio;
    data['defaultPaymentGateway'] = this.defaultPaymentGateway;
    data['defaultTheme'] = this.defaultTheme;
    data['cardStyle'] = this.cardStyle;
    data['taxAmount'] = this.taxAmount;
    if (this.faqCover != null) {
      data['faqCover'] = this.faqCover!.toJson();
    }
    if (this.contactUsCover != null) {
      data['contactUsCover'] = this.contactUsCover!.toJson();
    }
    if (this.profileCover != null) {
      data['profileCover'] = this.profileCover!.toJson();
    }
    return data;
  }
}

class DeliveryTime {
  String? title;
  String? description;

  DeliveryTime({this.title, this.description});

  DeliveryTime.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}

class CurrencyOptions {
  int? fractions;
  String? formation;

  CurrencyOptions({this.fractions, this.formation});

  CurrencyOptions.fromJson(Map<String, dynamic> json) {
    fractions = json['fractions'];
    formation = json['formation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fractions'] = this.fractions;
    data['formation'] = this.formation;
    return data;
  }
}

class Seo {
  OgImage? ogImage;
  dynamic ogTitle;
  dynamic metaTags;
  dynamic metaTitle;
  dynamic canonicalUrl;
  dynamic ogDescription;
  dynamic twitterHandle;
  String? metaDescription;
  dynamic twitterCardType;
  String? tagsInHeader;
  String? tagsIBody;

  Seo(
      {this.ogImage,
        this.ogTitle,
        this.metaTags,
        this.metaTitle,
        this.canonicalUrl,
        this.ogDescription,
        this.twitterHandle,
        this.metaDescription,
        this.twitterCardType,
        this.tagsInHeader,
        this.tagsIBody});

  Seo.fromJson(Map<String, dynamic> json) {
    ogImage =
    json['ogImage'] != null ? new OgImage.fromJson(json['ogImage']) : null;
    ogTitle = json['ogTitle'];
    metaTags = json['metaTags'];
    metaTitle = json['metaTitle'];
    canonicalUrl = json['canonicalUrl'];
    ogDescription = json['ogDescription'];
    twitterHandle = json['twitterHandle'];
    metaDescription = json['metaDescription'];
    twitterCardType = json['twitterCardType'];
    tagsInHeader = json['tagsInHeader'];
    tagsIBody = json['tagsIBody'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ogImage != null) {
      data['ogImage'] = this.ogImage!.toJson();
    }
    data['ogTitle'] = this.ogTitle;
    data['metaTags'] = this.metaTags;
    data['metaTitle'] = this.metaTitle;
    data['canonicalUrl'] = this.canonicalUrl;
    data['ogDescription'] = this.ogDescription;
    data['twitterHandle'] = this.twitterHandle;
    data['metaDescription'] = this.metaDescription;
    data['twitterCardType'] = this.twitterCardType;
    data['tagsInHeader'] = this.tagsInHeader;
    data['tagsIBody'] = this.tagsIBody;
    return data;
  }
}

class OgImage {
  String? thumbnail;
  String? original;
  int? id;
  String? fileName;

  OgImage({this.thumbnail, this.original, this.id, this.fileName});

  OgImage.fromJson(Map<String, dynamic> json) {
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

class SmsEvent {
  Admin? admin;
  Admin? vendor;
  Admin? customer;

  SmsEvent({this.admin, this.vendor, this.customer});

  SmsEvent.fromJson(Map<String, dynamic> json) {
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
    vendor = json['vendor'] != null ? new Admin.fromJson(json['vendor']) : null;
    customer =
    json['customer'] != null ? new Admin.fromJson(json['customer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.admin != null) {
      data['admin'] = this.admin!.toJson();
    }
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Admin {
  bool? refundOrder;
  bool? paymentOrder;
  bool? statusChangeOrder;

  Admin({this.refundOrder, this.paymentOrder, this.statusChangeOrder});

  Admin.fromJson(Map<String, dynamic> json) {
    refundOrder = json['refundOrder'];
    paymentOrder = json['paymentOrder'];
    statusChangeOrder = json['statusChangeOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refundOrder'] = this.refundOrder;
    data['paymentOrder'] = this.paymentOrder;
    data['statusChangeOrder'] = this.statusChangeOrder;
    return data;
  }
}

class ServerInfo {
  int? uploadMaxFilesize;
  String? memoryLimit;
  String? maxExecutionTime;
  String? maxInputTime;
  int? postMaxSize;

  ServerInfo(
      {this.uploadMaxFilesize,
        this.memoryLimit,
        this.maxExecutionTime,
        this.maxInputTime,
        this.postMaxSize});

  ServerInfo.fromJson(Map<String, dynamic> json) {
    uploadMaxFilesize = json['upload_max_filesize'];
    memoryLimit = json['memory_limit'];
    maxExecutionTime = json['max_execution_time'];
    maxInputTime = json['max_input_time'];
    postMaxSize = json['post_max_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['upload_max_filesize'] = this.uploadMaxFilesize;
    data['memory_limit'] = this.memoryLimit;
    data['max_execution_time'] = this.maxExecutionTime;
    data['max_input_time'] = this.maxInputTime;
    data['post_max_size'] = this.postMaxSize;
    return data;
  }
}

class ContactDetails {
  String? contact;
  String? whatsappNumber;
  List<Socials>? socials;
  String? website;
  Location? location;
  String? email;

  ContactDetails(
      {this.contact,
        this.whatsappNumber,
        this.socials,
        this.website,
        this.location,
        this.email});

  ContactDetails.fromJson(Map<String, dynamic> json) {
    contact = json['contact'];
    whatsappNumber = json['WhatsappNumber'];
    if (json['socials'] != null) {
      socials = <Socials>[];
      json['socials'].forEach((v) {
        socials!.add(new Socials.fromJson(v));
      });
    }
    website = json['website'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact'] = this.contact;
    data['WhatsappNumber'] = this.whatsappNumber;
    if (this.socials != null) {
      data['socials'] = this.socials!.map((v) => v.toJson()).toList();
    }
    data['website'] = this.website;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['email'] = this.email;
    return data;
  }
}

class Socials {
  String? icon;
  String? url;

  Socials({this.icon, this.url});

  Socials.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['url'] = this.url;
    return data;
  }
}

class Location {
  double? lat;
  double? lng;
  dynamic zip;
  dynamic city;
  String? state;
  String? country;
  String? formattedAddress;

  Location(
      {this.lat,
        this.lng,
        this.zip,
        this.city,
        this.state,
        this.country,
        this.formattedAddress});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    zip = json['zip'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    formattedAddress = json['formattedAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['zip'] = this.zip;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['formattedAddress'] = this.formattedAddress;
    return data;
  }
}

class PaymentGateway {
  String? name;
  String? title;

  PaymentGateway({this.name, this.title});

  PaymentGateway.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    return data;
  }
}

class FaqCover {
  dynamic original;
  dynamic thumbnail;

  FaqCover({this.original, this.thumbnail});

  FaqCover.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = this.original;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}