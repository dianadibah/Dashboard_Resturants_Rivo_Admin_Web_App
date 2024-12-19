// To parse this JSON data, do
//
//     final createResturantsResponse = createResturantsResponseFromJson(jsonString);

import 'dart:convert';

ResturantCreateUpdateResponse resturantCreateUpdateResponseFromJson(String str) => ResturantCreateUpdateResponse.fromJson(json.decode(str));

String resturantCreateUpdateResponseToJson(ResturantCreateUpdateResponse data) => json.encode(data.toJson());

class ResturantCreateUpdateResponse {
    String? message;
    Errors? errors;

    ResturantCreateUpdateResponse({
        this.message,
        this.errors,
    });

    ResturantCreateUpdateResponse copyWith({
        String? message,
        Errors? errors,
    }) => 
        ResturantCreateUpdateResponse(
            message: message ?? this.message,
            errors: errors ?? this.errors,
        );

    factory ResturantCreateUpdateResponse.fromJson(Map<String, dynamic> json) => ResturantCreateUpdateResponse(
        message: json["message"],
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors?.toJson(),
    };
}

class Errors {
    List<String>? color;
    List<String>? banner;

    Errors({
        this.color,
        this.banner,
    });

    Errors copyWith({
        List<String>? color,
        List<String>? banner,
    }) => 
        Errors(
            color: color ?? this.color,
            banner: banner ?? this.banner,
        );

    factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        color: json["color"] == null ? [] : List<String>.from(json["color"]!.map((x) => x)),
        banner: json["banner"] == null ? [] : List<String>.from(json["banner"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "color": color == null ? [] : List<dynamic>.from(color!.map((x) => x)),
        "banner": banner == null ? [] : List<dynamic>.from(banner!.map((x) => x)),
    };
}
