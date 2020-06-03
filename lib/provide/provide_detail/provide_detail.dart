// 模型层文件
class DetailsModle {
  String code;
  String statinfo;
  DetailsGoodsData data;

  DetailsModle({this.code, this.statinfo, this.data});

  DetailsModle.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    statinfo = json['statinfo'];
    DetailsGoodsData _detail = DetailsGoodsData.fromJson(json['data']);
    data = _detail ?? new DetailsGoodsData();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['statinfo'] = this.statinfo;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class DetailsGoodsData {
  String goodsSpu;
  String userCode;
  String roleId;
  List<Goods> goods;
  ExhibitionHall exhibitionHall;

  DetailsGoodsData(
      {this.goodsSpu,
      this.userCode,
      this.roleId,
      this.goods,
      this.exhibitionHall});

  DetailsGoodsData.fromJson(Map<String, dynamic> json) {
    goodsSpu = json['goodsSpu'];
    userCode = json['userCode'];
    roleId = json['roleId'];
    if (json['goods'] != null) {
      goods = new List<Goods>();
      json['goods'].forEach((v) {
        goods.add(new Goods.fromJson(v));
      });
    }
    exhibitionHall = json['exhibitionHall'] != null
        ? new ExhibitionHall.fromJson(json['exhibitionHall'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsSpu'] = this.goodsSpu;
    data['userCode'] = this.userCode;
    data['roleId'] = this.roleId;
    if (this.goods != null) {
      data['goods'] = this.goods.map((v) => v.toJson()).toList();
    }
    if (this.exhibitionHall != null) {
      data['exhibitionHall'] = this.exhibitionHall.toJson();
    }
    return data;
  }
}

class Goods {
  PeiZhi peiZhi;
  Null roleId;
  String styleName;
  String colorPhoto;
  Null count;
  String customization;
  Null id;
  String skuId;
  String goodsName;
  int categoryId;
  int cargoId;
  int goodsStyle;
  int colorValueId;
  String colorValue;
  String specValue;
  String specTop;
  int materialValueId;
  String materialValue;
  Null openMode;
  int goodsType;
  int promotionStatus;
  String goodsCostMarketSellingPrice;
  double goodsSellingPrice;
  double produceCost;
  int goodsStatus;
  String listPhoto;
  String exhibitionPhoto;
  String detailsPhoto;
  String createTime;
  String updateTime;
  Null deleteTime;
  int unitId;
  String unitName;
  String goodsSpu;
  int salesVolume;
  Null moreUnitPrice;
  int openId;
  String openValue;
  String mannerId;
  String mannerValue;
  int brandId;
  String brandValue;
  int surfaceId;
  String surfaceValue;
  Null positionId;
  String positionValue;
  Null doorThick;
  int likes;
  Null isRecommended;
  int pnum;
  int psize;

  Goods(
      {this.peiZhi,
      this.roleId,
      this.styleName,
      this.colorPhoto,
      this.count,
      this.customization,
      this.id,
      this.skuId,
      this.goodsName,
      this.categoryId,
      this.cargoId,
      this.goodsStyle,
      this.colorValueId,
      this.colorValue,
      this.specValue,
      this.specTop,
      this.materialValueId,
      this.materialValue,
      this.openMode,
      this.goodsType,
      this.promotionStatus,
      this.goodsCostMarketSellingPrice,
      this.goodsSellingPrice,
      this.produceCost,
      this.goodsStatus,
      this.listPhoto,
      this.exhibitionPhoto,
      this.detailsPhoto,
      this.createTime,
      this.updateTime,
      this.deleteTime,
      this.unitId,
      this.unitName,
      this.goodsSpu,
      this.salesVolume,
      this.moreUnitPrice,
      this.openId,
      this.openValue,
      this.mannerId,
      this.mannerValue,
      this.brandId,
      this.brandValue,
      this.surfaceId,
      this.surfaceValue,
      this.positionId,
      this.positionValue,
      this.doorThick,
      this.likes,
      this.isRecommended,
      this.pnum,
      this.psize});

  Goods.fromJson(Map<String, dynamic> json) {
    peiZhi =
        json['peiZhi'] != null ? new PeiZhi.fromJson(json['peiZhi']) : null;
    roleId = json['roleId'];
    styleName = json['styleName'];
    colorPhoto = json['colorPhoto'];
    count = json['count'];
    customization = json['customization'];
    id = json['id'];
    skuId = json['skuId'];
    goodsName = json['goodsName'];
    categoryId = json['categoryId'];
    cargoId = json['cargoId'];
    goodsStyle = json['goodsStyle'];
    colorValueId = json['colorValueId'];
    colorValue = json['colorValue'];
    specValue = json['specValue'];
    specTop = json['specTop'];
    materialValueId = json['materialValueId'];
    materialValue = json['materialValue'];
    openMode = json['openMode'];
    goodsType = json['goodsType'];
    promotionStatus = json['promotionStatus'];
    goodsCostMarketSellingPrice = json['goodsCostMarketSellingPrice'];
    goodsSellingPrice = json['goodsSellingPrice'];
    produceCost = json['produceCost'];
    goodsStatus = json['goodsStatus'];
    listPhoto = json['listPhoto'];
    exhibitionPhoto = json['exhibitionPhoto'];
    detailsPhoto = json['detailsPhoto'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    deleteTime = json['deleteTime'];
    unitId = json['unitId'];
    unitName = json['unitName'];
    goodsSpu = json['goodsSpu'];
    salesVolume = json['salesVolume'];
    moreUnitPrice = json['moreUnitPrice'];
    openId = json['openId'];
    openValue = json['openValue'];
    mannerId = json['mannerId'];
    mannerValue = json['mannerValue'];
    brandId = json['brandId'];
    brandValue = json['brandValue'];
    surfaceId = json['surfaceId'];
    surfaceValue = json['surfaceValue'];
    positionId = json['positionId'];
    positionValue = json['positionValue'];
    doorThick = json['doorThick'];
    likes = json['likes'];
    isRecommended = json['isRecommended'];
    pnum = json['pnum'];
    psize = json['psize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.peiZhi != null) {
      data['peiZhi'] = this.peiZhi.toJson();
    }
    data['roleId'] = this.roleId;
    data['styleName'] = this.styleName;
    data['colorPhoto'] = this.colorPhoto;
    data['count'] = this.count;
    data['customization'] = this.customization;
    data['id'] = this.id;
    data['skuId'] = this.skuId;
    data['goodsName'] = this.goodsName;
    data['categoryId'] = this.categoryId;
    data['cargoId'] = this.cargoId;
    data['goodsStyle'] = this.goodsStyle;
    data['colorValueId'] = this.colorValueId;
    data['colorValue'] = this.colorValue;
    data['specValue'] = this.specValue;
    data['specTop'] = this.specTop;
    data['materialValueId'] = this.materialValueId;
    data['materialValue'] = this.materialValue;
    data['openMode'] = this.openMode;
    data['goodsType'] = this.goodsType;
    data['promotionStatus'] = this.promotionStatus;
    data['goodsCostMarketSellingPrice'] = this.goodsCostMarketSellingPrice;
    data['goodsSellingPrice'] = this.goodsSellingPrice;
    data['produceCost'] = this.produceCost;
    data['goodsStatus'] = this.goodsStatus;
    data['listPhoto'] = this.listPhoto;
    data['exhibitionPhoto'] = this.exhibitionPhoto;
    data['detailsPhoto'] = this.detailsPhoto;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['deleteTime'] = this.deleteTime;
    data['unitId'] = this.unitId;
    data['unitName'] = this.unitName;
    data['goodsSpu'] = this.goodsSpu;
    data['salesVolume'] = this.salesVolume;
    data['moreUnitPrice'] = this.moreUnitPrice;
    data['openId'] = this.openId;
    data['openValue'] = this.openValue;
    data['mannerId'] = this.mannerId;
    data['mannerValue'] = this.mannerValue;
    data['brandId'] = this.brandId;
    data['brandValue'] = this.brandValue;
    data['surfaceId'] = this.surfaceId;
    data['surfaceValue'] = this.surfaceValue;
    data['positionId'] = this.positionId;
    data['positionValue'] = this.positionValue;
    data['doorThick'] = this.doorThick;
    data['likes'] = this.likes;
    data['isRecommended'] = this.isRecommended;
    data['pnum'] = this.pnum;
    data['psize'] = this.psize;
    return data;
  }
}

class PeiZhi {
  Null categoryMapper;

  PeiZhi({this.categoryMapper});

  PeiZhi.fromJson(Map<String, dynamic> json) {
    categoryMapper = json['categoryMapper'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryMapper'] = this.categoryMapper;

    return data;
  }
}

class ExhibitionHall {
  int id;
  String name;
  String address;
  String contactPhone;
  String photo;
  String longitude;
  String latitude;
  int pnum;
  int psize;

  ExhibitionHall(
      {this.id,
      this.name,
      this.address,
      this.contactPhone,
      this.photo,
      this.longitude,
      this.latitude,
      this.pnum,
      this.psize});

  ExhibitionHall.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    contactPhone = json['contactPhone'];
    photo = json['photo'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    pnum = json['pnum'];
    psize = json['psize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['contactPhone'] = this.contactPhone;
    data['photo'] = this.photo;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['pnum'] = this.pnum;
    data['psize'] = this.psize;
    return data;
  }
}
