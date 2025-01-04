class Item {
  final String id;
  final String name;
  final String description;

  Item({
    required this.id,
    required this.name,
    required this.description,
  });

  Item copyWith({String? name, String? description}) {
    return Item(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
