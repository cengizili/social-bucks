import 'dart:math';

import 'package:intl/intl.dart';
import 'package:social_bucks/models/base_model.dart';
import 'package:social_bucks/models/enums.dart';

typedef Collector<T extends BaseModel> = Map<String, T>;

extension CollectorX<T extends BaseModel> on Collector<T>{
  void add(T model){
    this[model.id] = model;
  }
  Map<K, E> transformEntries<K, E extends BaseModel>(
      K Function(T) keyTransform,
      E Function(T) valueTransform) {
    // Transform each entry with the provided function and return a new map
    return Map<K, E>.fromEntries(
      this.entries.map(
        (entry) => MapEntry(keyTransform(entry.value), valueTransform(entry.value)),
      ),
    );
  }

  Map<K, E> transformEntriesIf<K, E extends BaseModel>(
      K Function(T) keyTransform,
      E Function(T) valueTransform,
      bool Function(T) predicate) {
    // Transform each entry with the provided functions and return a new map if they satisfy the predicate
    return Map<K, E>.fromEntries(
      this.entries.where((entry) => predicate(entry.value)).map(
        (entry) => MapEntry(keyTransform(entry.value), valueTransform(entry.value)),
      ),
    );
  }

  Collector<T> where(bool Function(T) predicate) {
    // Return a new map containing only entries where the value satisfies the predicate
    return Map<String, T>.fromEntries(
      this.entries.where((entry) => predicate(entry.value))
    );
  }

  MapEntry<String, T> firstWhere(bool Function(T) predicate, {MapEntry<String, T> Function()? orElse}) {
    // Return a new map containing only entries where the value satisfies the predicate
    return this.entries.firstWhere((entry) => predicate(entry.value), orElse: orElse);
  }

  bool any(bool Function(T) predicate) {
    // Return a new map containing only entries where the value satisfies the predicate
    return this.entries.any((entry) => predicate(entry.value));
  }

  Collector<T> take(int count) {
    return Map<String, T>.fromEntries(this.entries.toList().take(count));
  }

  Collector<T> skip(int count) {
    return Map<String, T>.fromEntries(this.entries.toList().skip(count));
  }

  Collector<T> shuffled(int seed) {
    final entries = this.entries.toList();
    entries.shuffle(Random(seed));
    return Map<String, T>.fromEntries(entries);
  }

  Collector<T> sample (int size, int seed) {
    if (size > this.length)
    size = this.length;
    return Map<String, T>.fromEntries(
      this.shuffled(seed).entries.take(size)
    );
  }

  Collector<T> randomSlice(int minL, int maxL) {
    if (this.length <= maxL)
    return this;
    final randomNumber = Random(int.parse(DateFormat('d').format(DateTime.now()))).nextInt(maxL)+minL;
    return this.take(randomNumber);
  }

  Collector<T> sorted (int Function(T a, T b) compare) {
    var sortedEntries = entries.toList()
      ..sort((a, b) => compare(a.value, b.value));
      return Map<String, T>.fromEntries(sortedEntries);
  }
}
