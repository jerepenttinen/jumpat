import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WatchingList<T> extends ConsumerWidget {
  const WatchingList({
    required this.provider,
    required this.itemBuilder,
    super.key,
  });
  final AutoDisposeStreamProvider<List<T>> provider;
  final Widget? Function(T) itemBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(provider);
    return dataAsync.when(
      data: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, index) => itemBuilder(data[index]),
      ),
      error: (error, stackTrace) => Center(child: Text('$error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
