import 'models.dart';

class Story {
  String section;
  String subSection;
  String title;
  String abstractTitle;
  String url;
  String createdDate;
  List<Multimedia> multimedia;

  Story({
    this.section,
    this.subSection,
    this.title,
    this.abstractTitle,
    this.url,
    this.createdDate,
    this.multimedia,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      section: json['section'],
      subSection: json['subSection'],
      title: json['title'],
      abstractTitle: json['abstractTitle'],
      url: json['url'],
      createdDate: json['createdDate'],
      multimedia: List<Multimedia>.from(
          json['multimedia']?.map((x) => Multimedia.fromJson(x))),
    );
  }
}
