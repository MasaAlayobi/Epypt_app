import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class Reason {
  String rejection_reason;
  Reason({
    required this.rejection_reason,
  });

  Reason copyWith({
    String? rejection_reason,
  }) {
    return Reason(
      rejection_reason: rejection_reason ?? this.rejection_reason,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rejection_reason': rejection_reason,
    };
  }

  factory Reason.fromMap(Map<String, dynamic> map) {
    return Reason(
      rejection_reason: map['rejection_reason'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reason.fromJson(String source) => Reason.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Reason(rejection_reason: $rejection_reason)';

  @override
  bool operator ==(covariant Reason other) {
    if (identical(this, other)) return true;
  
    return 
      other.rejection_reason == rejection_reason;
  }

  @override
  int get hashCode => rejection_reason.hashCode;
}
