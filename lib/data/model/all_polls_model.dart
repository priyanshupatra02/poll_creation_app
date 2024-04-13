import 'dart:convert';

class AllPollsModel {
  AllPollsModel({
    required this.code,
    required this.reason,
    required this.data,
    required this.pageMetadata,
  });

  final int code;
  final String reason;
  final List<PollData> data;
  final PageMetadata pageMetadata;

  factory AllPollsModel.fromJson(Map<String, dynamic> json) => AllPollsModel(
        code: json["code"],
        reason: json["reason"],
        data: List<PollData>.from(json["data"].map((x) => PollData.fromJson(x))),
        pageMetadata: PageMetadata.fromJson(json["page_metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "reason": reason,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "page_metadata": pageMetadata.toJson(),
      };

  static List<AllPollsModel> pollFromJson(String str) =>
      List<AllPollsModel>.from(json.decode(str).map((x) => AllPollsModel.fromJson(x)));
  static String pollToJson(List<AllPollsModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class PageMetadata {
  PageMetadata({
    required this.count,
    required this.next,
    required this.previous,
    required this.currentPage,
    required this.totalCount,
    required this.totalPages,
  });

  final int count;
  final dynamic next;
  final dynamic previous;
  final int currentPage;
  final int totalCount;
  final int totalPages;

  factory PageMetadata.fromJson(Map<String, dynamic> json) => PageMetadata(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        currentPage: json["current_page"],
        totalCount: json["total_count"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "current_page": currentPage,
        "total_count": totalCount,
        "total_pages": totalPages,
      };
}

class PollData {
  PollData({
    required this.id,
    required this.userType,
    required this.createdAt,
    required this.createdBy,
    required this.topic,
    required this.statement,
    required this.pollType,
    required this.textOptions,
    required this.newsId,
    required this.noOfLikes,
    required this.noOfDislikes,
    required this.isAnonymous,
    required this.comments,
    required this.usersInteracted,
    required this.response,
  });

  final String id;
  final List<dynamic> userType;
  final String createdAt;
  final CreatedBy createdBy;
  final String topic;
  final String statement;
  final String pollType;
  final List<String> textOptions;
  final dynamic newsId;
  final int noOfLikes;
  final int noOfDislikes;
  final bool isAnonymous;
  final List<dynamic> comments;
  final List<dynamic> usersInteracted;
  final Map<String, List<dynamic>> response;

  factory PollData.fromJson(Map<String, dynamic> json) => PollData(
        id: json["_id"],
        userType: List<dynamic>.from(json["user_type"].map((x) => x)),
        createdAt: json["created_at"],
        createdBy: CreatedBy.fromJson(json["created_by"]),
        topic: json["topic"],
        statement: json["statement"],
        pollType: json["poll_type"],
        textOptions: List<String>.from(json["text_options"].map((x) => x)),
        newsId: json["news_id"],
        noOfLikes: json["no_of_likes"],
        noOfDislikes: json["no_of_dislikes"],
        isAnonymous: json["is_anonymous"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        usersInteracted: List<dynamic>.from(json["users_interacted"].map((x) => x)),
        response: Map.from(json["response"])
            .map((k, v) => MapEntry<String, List<dynamic>>(k, List<dynamic>.from(v.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_type": List<dynamic>.from(userType.map((x) => x)),
        "created_at": createdAt,
        "created_by": createdBy.toJson(),
        "topic": topic,
        "statement": statement,
        "poll_type": pollType,
        "text_options": List<dynamic>.from(textOptions.map((x) => x)),
        "news_id": newsId,
        "no_of_likes": noOfLikes,
        "no_of_dislikes": noOfDislikes,
        "is_anonymous": isAnonymous,
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "users_interacted": List<dynamic>.from(usersInteracted.map((x) => x)),
        "response": Map.from(response)
            .map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
      };

  PollData copyWith({
    String? id,
    List<dynamic>? userType,
    String? createdAt,
    CreatedBy? createdBy,
    String? topic,
    String? statement,
    String? pollType,
    List<String>? textOptions,
    dynamic newsId,
    int? noOfLikes,
    int? noOfDislikes,
    bool? isAnonymous,
    List<dynamic>? comments,
    List<dynamic>? usersInteracted,
    Map<String, List<dynamic>>? response,
  }) =>
      PollData(
        id: id ?? this.id,
        userType: userType ?? this.userType,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        topic: topic ?? this.topic,
        statement: statement ?? this.statement,
        pollType: pollType ?? this.pollType,
        textOptions: textOptions ?? this.textOptions,
        newsId: newsId ?? this.newsId,
        noOfLikes: noOfLikes ?? this.noOfLikes,
        noOfDislikes: noOfDislikes ?? this.noOfDislikes,
        isAnonymous: isAnonymous ?? this.isAnonymous,
        comments: comments ?? this.comments,
        usersInteracted: usersInteracted ?? this.usersInteracted,
        response: response ?? this.response,
      );
}

class CreatedBy {
  CreatedBy({
    required this.id,
    required this.name,
  });

  final dynamic id;
  final String name;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
