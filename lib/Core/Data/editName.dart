// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EditNameRequest {
  String first_name;
 String middle_name;
 String last_name;
  EditNameRequest({
    required this.first_name,
    required this.middle_name,
    required this.last_name,
  });

  EditNameRequest copyWith({
    String? first_name,
    String? middle_name,
    String? last_name,
  }) {
    return EditNameRequest(
      first_name: first_name ?? this.first_name,
      middle_name: middle_name ?? this.middle_name,
      last_name: last_name ?? this.last_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': first_name,
      'middle_name': middle_name,
      'last_name': last_name,
    };
  }

  factory EditNameRequest.fromMap(Map<String, dynamic> map) {
    return EditNameRequest(
      first_name: map['first_name'] as String,
      middle_name: map['middle_name'] as String,
      last_name: map['last_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EditNameRequest.fromJson(String source) => EditNameRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'EditNameRequest(first_name: $first_name, middle_name: $middle_name, last_name: $last_name)';

  @override
  bool operator ==(covariant EditNameRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.first_name == first_name &&
      other.middle_name == middle_name &&
      other.last_name == last_name;
  }

  @override
  int get hashCode => first_name.hashCode ^ middle_name.hashCode ^ last_name.hashCode;
}
