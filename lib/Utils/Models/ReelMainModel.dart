class ReelMainModel {
  int? totalCategories;
  int? totalPages;
  int? currentPage;
  List<Categories>? categories;

  ReelMainModel(
      {this.totalCategories,
      this.totalPages,
      this.currentPage,
      this.categories});

  ReelMainModel.fromJson(Map<String, dynamic> json) {
    totalCategories = json['totalCategories'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCategories'] = this.totalCategories;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  bool? bools;
  List<Reels>? reels;

  Categories({this.id, this.name, this.createdAt, this.updatedAt, this.reels});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bools = false;
    if (json['reels'] != null) {
      reels = <Reels>[];
      json['reels'].forEach((v) {
        reels!.add(new Reels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.reels != null) {
      data['reels'] = this.reels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reels {
  int? id;
  String? title;
  String? videoUrl;
  String? previewUrl;
  int? indexnumber;
  String? description;
  String? image;
  int? categoryId;

  Reels(
      {this.id,
      this.title,
      this.videoUrl,
      this.previewUrl,
      this.indexnumber,
      this.description,
      this.image,
      this.categoryId});

  Reels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    videoUrl = json['videoUrl'];
    previewUrl = json['previewUrl'];
    indexnumber = json['indexnumber'];
    description = json['description'];
    image = json['image'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['videoUrl'] = this.videoUrl;
    data['previewUrl'] = this.previewUrl;
    data['indexnumber'] = this.indexnumber;
    data['description'] = this.description;
    data['image'] = this.image;
    data['categoryId'] = this.categoryId;
    return data;
  }
}
