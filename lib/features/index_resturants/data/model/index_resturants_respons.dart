// To parse this JSON data, do
//
//     final indexResturantsResponse = indexResturantsResponseFromJson(jsonString);

import 'dart:convert';

IndexResturantsResponse indexResturantsResponseFromJson(String str) => IndexResturantsResponse.fromJson(json.decode(str));

String indexResturantsResponseToJson(IndexResturantsResponse data) => json.encode(data.toJson());

class IndexResturantsResponse {
    bool? success;
    String? message;
    Data? data;

    IndexResturantsResponse({
        this.success,
        this.message,
        this.data,
    });

    IndexResturantsResponse copyWith({
        bool? success,
        String? message,
        Data? data,
    }) => 
        IndexResturantsResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory IndexResturantsResponse.fromJson(Map<String, dynamic> json) => IndexResturantsResponse(
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
    List<Resturant>? resturants;
    int? count;

    Data({
        this.resturants,
        this.count,
    });

    Data copyWith({
        List<Resturant>? resturants,
        int? count,
    }) => 
        Data(
            resturants: resturants ?? this.resturants,
            count: count ?? this.count,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        resturants: json["resturants"] == null ? [] : List<Resturant>.from(json["resturants"]!.map((x) => Resturant.fromJson(x))),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "resturants": resturants == null ? [] : List<dynamic>.from(resturants!.map((x) => x.toJson())),
        "count": count,
    };
}

class Resturant {
    int? id;
    String? name;
    String? color;
    int? status;
    String? phone;
    String? address;
    String? facebookUrl;
    String? instagramUrl;
    int? discountPrecent;
    int? firstAward;
    AdminResturant? adminResturant;
    Subscriptions? subscriptions;

    Resturant({
        this.id,
        this.name,
        this.color,
        this.status,
        this.phone,
        this.address,
        this.facebookUrl,
        this.instagramUrl,
        this.discountPrecent,
        this.firstAward,
        this.adminResturant,
        this.subscriptions,
    });

    Resturant copyWith({
        int? id,
        String? name,
        String? color,
        int? status,
        String? phone,
        String? address,
        String? facebookUrl,
        String? instagramUrl,
        int? discountPrecent,
        int? firstAward,
        AdminResturant? adminResturant,
        Subscriptions? subscriptions,
    }) => 
        Resturant(
            id: id ?? this.id,
            name: name ?? this.name,
            color: color ?? this.color,
            status: status ?? this.status,
            phone: phone ?? this.phone,
            address: address ?? this.address,
            facebookUrl: facebookUrl ?? this.facebookUrl,
            instagramUrl: instagramUrl ?? this.instagramUrl,
            discountPrecent: discountPrecent ?? this.discountPrecent,
            firstAward: firstAward ?? this.firstAward,
            adminResturant: adminResturant ?? this.adminResturant,
            subscriptions: subscriptions ?? this.subscriptions,
        );

    factory Resturant.fromJson(Map<String, dynamic> json) => Resturant(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        status: json["status"],
        phone: json["phone"],
        address: json["address"],
        facebookUrl: json["facebook_url"],
        instagramUrl: json["instagram_url"],
        discountPrecent: json["discount_precent"],
        firstAward: json["first_award"],
        adminResturant: json["adminResturant"] == null ? null : AdminResturant.fromJson(json["adminResturant"]),
        subscriptions: json["subscriptions"] == null ? null : Subscriptions.fromJson(json["subscriptions"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "status": status,
        "phone": phone,
        "address": address,
        "facebook_url": facebookUrl,
        "instagram_url": instagramUrl,
        "discount_precent": discountPrecent,
        "first_award": firstAward,
        "adminResturant": adminResturant?.toJson(),
        "subscriptions": subscriptions?.toJson(),
    };
}

class AdminResturant {
    String? username;

    AdminResturant({
        this.username,
    });

    AdminResturant copyWith({
        String? username,
    }) => 
        AdminResturant(
            username: username ?? this.username,
        );

    factory AdminResturant.fromJson(Map<String, dynamic> json) => AdminResturant(
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
    };
}

class Subscriptions {
    int? id;
    DateTime? startDate;
    DateTime? endDate;
    int? status;

    Subscriptions({
        this.id,
        this.startDate,
        this.endDate,
        this.status,
    });

    Subscriptions copyWith({
        int? id,
        DateTime? startDate,
        DateTime? endDate,
        int? status,
    }) => 
        Subscriptions(
            id: id ?? this.id,
            startDate: startDate ?? this.startDate,
            endDate: endDate ?? this.endDate,
            status: status ?? this.status,
        );

    factory Subscriptions.fromJson(Map<String, dynamic> json) => Subscriptions(
        id: json["id"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "status": status,
    };
}
