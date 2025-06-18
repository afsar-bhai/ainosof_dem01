
import 'dart:convert';

VerificationResponse verificationResponseFromJson(String str) => VerificationResponse.fromJson(json.decode(str));

String verificationResponseToJson(VerificationResponse data) => json.encode(data.toJson());

class VerificationResponse {
  String? message;
  bool? status;

  VerificationResponse({
    this.message,
    this.status,
  });

  factory VerificationResponse.fromJson(Map<String, dynamic> json) => VerificationResponse(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}
