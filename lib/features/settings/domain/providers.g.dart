// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$LocaleStateHash() => r'c66de1a5dca26c16e1104db7ed6bc54685708c23';

/// See also [LocaleState].
final localeStateProvider = NotifierProvider<LocaleState, Locale>(
  LocaleState.new,
  name: r'localeStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$LocaleStateHash,
);
typedef LocaleStateRef = NotifierProviderRef<Locale>;

abstract class _$LocaleState extends Notifier<Locale> {
  @override
  Locale build();
}

String _$DefaultRepetitionCountHash() =>
    r'e347d164eac1dd51e3a63e6d4a4541426ab51a42';

/// See also [DefaultRepetitionCount].
final defaultRepetitionCountProvider =
    NotifierProvider<DefaultRepetitionCount, int>(
  DefaultRepetitionCount.new,
  name: r'defaultRepetitionCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$DefaultRepetitionCountHash,
);
typedef DefaultRepetitionCountRef = NotifierProviderRef<int>;

abstract class _$DefaultRepetitionCount extends Notifier<int> {
  @override
  int build();
}
