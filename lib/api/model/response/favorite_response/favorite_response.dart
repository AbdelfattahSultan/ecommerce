class FavoriteResponse {
  String? status;
  String? message;
  List<String>? data;

  FavoriteResponse({this.status, this.message, this.data});

  FavoriteResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? List<String>.from(json['data']) : [];
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data};
  }
}
