class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Play Apex'),
      ToDo(id: '02', todoText: 'Do Flutter Tutorial', isDone: true),
      ToDo(id: '03', todoText: 'Read Russian Novel'),
      ToDo(id: '04', todoText: 'Call the duck'),
      ToDo(id: '05', todoText: 'Feed the cat'),
      ToDo(id: '06', todoText: 'Pet a lizard')
    ];
  }
}