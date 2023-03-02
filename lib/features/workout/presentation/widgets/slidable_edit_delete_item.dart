import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableEditDeleteItem extends StatelessWidget {
  const SlidableEditDeleteItem({
    required this.onDelete,
    required this.onEdit,
    required this.child,
    super.key,
  });
  final void Function() onDelete;
  final void Function(BuildContext) onEdit;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.3,
        children: [
          SlidableAction(
            label: t.edit,
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icons.edit,
            onPressed: onEdit,
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.3,
        dismissible: DismissiblePane(
          onDismissed: onDelete,
        ),
        children: [
          SlidableAction(
            label: t.delete,
            backgroundColor: Theme.of(context).colorScheme.error,
            icon: Icons.delete,
            onPressed: (context) => onDelete(),
          )
        ],
      ),
      child: child,
    );
  }
}
