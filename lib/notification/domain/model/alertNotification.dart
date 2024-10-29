class AlertNotification{
  final String title;
  final String description;
  final int userId;
  AlertNotification({
     required this.title,
     required this.description,
     required this.userId
  });

  factory AlertNotification.fromJson(Map<String, dynamic> json){
    return AlertNotification(
        title: json["title"],
        description: json["content"],
        userId: json["userId"]
    );
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> json = {
      "title": title,
      "content": description,
      "userId": userId
    };
    return json;
  }
}