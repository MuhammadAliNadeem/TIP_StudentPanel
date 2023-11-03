class CarouselSliderModel {
  String? imagePath;
  String? id;
  int? timestamp;

  CarouselSliderModel({this.imagePath, this.id, this.timestamp});

  CarouselSliderModel.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    id = json['id'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imagePath'] = imagePath;
    data['id'] = id;
    data['timestamp'] = timestamp;
    return data;
  }
}
