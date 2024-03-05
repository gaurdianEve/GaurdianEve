class FakeContact {
  final String callName;
  final String phoneNo;

  FakeContact({
    required this.callName,
    required this.phoneNo,
  });

  Map<String, dynamic> toJson() {
    return {
      'callName': callName,
      'phoneNo': phoneNo,
    };
  }

  // CopyWith method to create a new instance with optional updates
  FakeContact copyWith({
    String? callName,
    String? phoneNo,
  }) {
    return FakeContact(
      callName: callName ?? this.callName,
      phoneNo: phoneNo ?? this.phoneNo,
    );
  }

  // Factory constructor for creating instances from JSON
  factory FakeContact.fromJson(Map<String, dynamic> json) {
    return FakeContact(
      callName: json['callName'] as String,
      phoneNo: json['phoneNo'] as String,
    );
  }
}
