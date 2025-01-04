import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/item.dart';
import '../providers/item_provider.dart';
import '../screens/item_form_screen.dart';

class ItemTile extends ConsumerWidget {
  final Item item;

  const ItemTile({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(item.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ItemFormScreen(
                    id: item.id,
                    initialName: item.name,
                    initialDescription: item.description,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              ref.read(itemListProvider.notifier).deleteItem(item.id);
            },
          ),
        ],
      ),
    );
  }
}
