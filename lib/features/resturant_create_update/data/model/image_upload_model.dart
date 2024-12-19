// To parse this JSON data, do
//
//     final imageUploadResponse = imageUploadResponseFromJson(jsonString);

import 'dart:convert';

ImageUploadResponse imageUploadResponseFromJson(String str) => ImageUploadResponse.fromJson(json.decode(str));

String imageUploadResponseToJson(ImageUploadResponse data) => json.encode(data.toJson());

class ImageUploadResponse {
    bool? success;
    String? message;
    Data? data;

    ImageUploadResponse({
        this.success,
        this.message,
        this.data,
    });

    ImageUploadResponse copyWith({
        bool? success,
        String? message,
        Data? data,
    }) => 
        ImageUploadResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory ImageUploadResponse.fromJson(Map<String, dynamic> json) => ImageUploadResponse(
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
    String? mediaUrl;

    Data({
        this.mediaUrl,
    });

    Data copyWith({
        String? mediaUrl,
    }) => 
        Data(
            mediaUrl: mediaUrl ?? this.mediaUrl,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        mediaUrl: json["mediaUrl"],
    );

    Map<String, dynamic> toJson() => {
        "mediaUrl": mediaUrl,
    };
}
