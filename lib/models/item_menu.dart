import 'dart:convert';

class ItemMenu {
  // {"id":0,"name":"Chọn tỉnh thành"}
  final String key;

  final String value;
  ItemMenu({
    required this.key,
    required this.value,
  });

  ItemMenu copyWith({
    String? key,
    String? value,
  }) {
    return ItemMenu(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'value': value,
    };
  }

  factory ItemMenu.fromMap(Map<String, dynamic> map) {
    return ItemMenu(
      key: map['key'] ?? '',
      value: map['value'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemMenu.fromJson(String source) => ItemMenu.fromMap(json.decode(source));

  @override
  String toString() => 'ItemMenu(key: $key, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemMenu && other.key == key && other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}
