class ApodModel {
  String? copyright;
  String? date;
  late String explanation;
  late String hdurl;
  String? mediaType;
  String? serviceVersion;
  late String title;
  String? url;

  ApodModel(
      {this.copyright,
      this.date,
      required this.explanation,
      required this.hdurl,
      this.mediaType,
      this.serviceVersion,
      required this.title,
      this.url});

  ApodModel.fromJson(Map<String, dynamic> json) {
    copyright = json['copyright'];
    date = json['date'];
    explanation = json['explanation'];
    hdurl = json['hdurl'];
    mediaType = json['media_type'];
    serviceVersion = json['service_version'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['copyright'] = this.copyright;
    data['date'] = this.date;
    data['explanation'] = this.explanation;
    data['hdurl'] = this.hdurl;
    data['media_type'] = this.mediaType;
    data['service_version'] = this.serviceVersion;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
