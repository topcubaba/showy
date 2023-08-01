class Todo {
  String? uuid;
  String? text;
  bool done;

  Todo({required this.uuid, this.text, this.done = false});

  factory Todo.fromJson(Map<String, dynamic> json) =>
      Todo(uuid: json['uuid'], text: json['text'], done: json['done']);

  Map<String, dynamic> toJson() => {'uuid': uuid, 'text': text, 'done': done};
}
