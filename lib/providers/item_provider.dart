import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/item.dart';
import 'package:uuid/uuid.dart';

final itemListProvider =
    StateNotifierProvider<ItemListNotifier, List<Item>>((ref) {
  return ItemListNotifier();
});

class ItemListNotifier extends StateNotifier<List<Item>> {
  ItemListNotifier() : super([]);

  final _uuid = const Uuid();

  void addItem(String name, String description) {
    final newItem = Item(
      id: _uuid.v4(),
      name: name,
      description: description,
    );
    state = [...state, newItem];
  }

  void updateItem(String id, String name, String description) {
    state = state.map((item) {
      return item.id == id
          ? item.copyWith(name: name, description: description)
          : item;
    }).toList();
  }

  void deleteItem(String id) {
    state = state.where((item) => item.id != id).toList();
  }
}
