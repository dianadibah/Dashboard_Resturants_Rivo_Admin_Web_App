// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
    bool? success;
    String? message;
    Data? data;

    AuthResponse({
        this.success,
        this.message,
        this.data,
    });

    AuthResponse copyWith({
        bool? success,
        String? message,
        Data? data,
    }) => 
        AuthResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    Admin? admin;

    Data({
        this.admin,
    });

    Data copyWith({
        Admin? admin,
    }) => 
        Data(
            admin: admin ?? this.admin,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        admin: json["admin"] == null ? null : Admin.fromJson(json["admin"]),
    );

    Map<String, dynamic> toJson() => {
        "admin": admin?.toJson(),
    };
}

class Admin {
    int? id;
    String? username;
    String? accessToken;
    int? isBlocked;

    Admin({
        this.id,
        this.username,
        this.accessToken,
        this.isBlocked,
    });

    Admin copyWith({
        int? id,
        String? username,
        String? accessToken,
        int? isBlocked,
    }) => 
        Admin(
            id: id ?? this.id,
            username: username ?? this.username,
            accessToken: accessToken ?? this.accessToken,
            isBlocked: isBlocked ?? this.isBlocked,
        );

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json["id"],
        username: json["username"],
        accessToken: json["access_token"],
        isBlocked: json["is_blocked"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "access_token": accessToken,
        "is_blocked": isBlocked,
    };
}
