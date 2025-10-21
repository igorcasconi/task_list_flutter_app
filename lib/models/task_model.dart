class TaskModel {
  String? _title = "";
  String? _id = "";
  String? _description = "";
  String? _updatedAt = "";
  bool? _done = false;

  TaskModel({String? title, String? description, bool? done}) {
    if (title != null) {
      _title = title;
    }

    if (description != null) {
      _description = description;
    }

    if (done != null) {
      _done = done;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get id => _id;
  set objectId(String? id) => _id = id;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  bool? get done => _done;
  set done(bool? done) => _done = done;

  TaskModel.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _description = json['description'];
    _updatedAt = json['updatedAt'];
    _done = json['done'];
    _id = json['objectId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = _title;
    data['description'] = _description;
    data['done'] = _done;

    return data;
  }
}
