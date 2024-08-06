// To parse this JSON data, do
//
//     final jobDetailsModel = jobDetailsModelFromJson(jsonString);

import 'dart:convert';

JobDetailsModel jobDetailsModelFromJson(String str) =>
    JobDetailsModel.fromJson(json.decode(str));

String jobDetailsModelToJson(JobDetailsModel data) =>
    json.encode(data.toJson());

class JobDetailsModel {
  JobDetailsModel({
    this.statusCode,
    this.msg,
    this.data,
  });

  final int? statusCode;
  final String? msg;
  final Data? data;

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) =>
      JobDetailsModel(
        statusCode: json["statusCode"] == null ? null : json["statusCode"]!,
        msg: json["msg"] == null ? null : json["msg"]!,
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode == null ? null : statusCode!,
        "msg": msg == null ? null : msg!,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.address,
    this.containerId,
    this.packageType,
    this.imageFile,
    this.voiceFile,
    this.startTime,
    this.endTime,
    this.userId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.instructions,
    this.latitude,
    this.longitude,
    this.approvedBy,
    this.checkout,
    this.jobHelpers,
  });

  final int? id;
  final String? name;
  final String? address;
  final int? containerId;
  final String? packageType;
  final dynamic imageFile;
  final dynamic voiceFile;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? userId;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic instructions;
  final double? latitude;
  final double? longitude;
  final dynamic approvedBy;
  final Checkout? checkout;
  final List<JobHelper>? jobHelpers;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"]!,
        name: json["name"] == null ? null : json["name"]!,
        address: json["address"] == null ? null : json["address"]!,
        containerId:
            json["container_id"] == null ? null : json["container_id"]!,
        packageType:
            json["package_type"] == null ? null : json["package_type"]!,
        imageFile: json["image_file"],
        voiceFile: json["voice_file"],
        startTime: json["start_time"] == null
            ? null
            : DateTime.parse(json["start_time"]),
        endTime:
            json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
        userId: json["user_id"] == null ? null : json["user_id"]!,
        status: json["status"] == null ? null : json["status"]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        instructions: json["instructions"],
        latitude:
            json["latitude"] == null ? null : double.parse(json["latitude"]),
        longitude:
            json["longitude"] == null ? null : double.parse(json["longitude"]),
        approvedBy: json["approved_by"],
        checkout: json["checkout"] == null
            ? null
            : Checkout.fromJson(json["checkout"]),
        jobHelpers: json["job_helpers"] == null
            ? null
            : List<JobHelper>.from(
                json["job_helpers"].map((x) => JobHelper.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id!,
        "name": name == null ? null : name!,
        "address": address == null ? null : address!,
        "container_id": containerId == null ? null : containerId!,
        "package_type": packageType == null ? null : packageType!,
        "image_file": imageFile,
        "voice_file": voiceFile,
        "start_time": startTime == null ? null : startTime!.toIso8601String(),
        "end_time": endTime == null ? null : endTime!.toIso8601String(),
        "user_id": userId == null ? null : userId!,
        "status": status == null ? null : status!,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "instructions": instructions,
        "latitude": latitude == null ? null : latitude!,
        "longitude": longitude == null ? null : longitude!,
        "approved_by": approvedBy,
        "checkout": checkout == null ? null : checkout!.toJson(),
        "job_helpers": jobHelpers == null
            ? null
            : List<dynamic>.from(jobHelpers!.map((x) => x.toJson())),
      };
}

class Checkout {
  Checkout({
    this.id,
    this.jobId,
    this.total,
    this.tax,
    this.taxRate,
    this.subTotal,
    this.baseFare,
    this.userId,
    this.totalHelpers,
    this.days,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? jobId;
  final String? total;
  final String? tax;
  final String? taxRate;
  final String? subTotal;
  final String? baseFare;
  final int? userId;
  final int? totalHelpers;
  final int? days;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
        id: json["id"] == null ? null : json["id"]!,
        jobId: json["job_id"] == null ? null : json["job_id"]!,
        total: json["total"] == null ? null : json["total"]!,
        tax: json["tax"] == null ? null : json["tax"]!,
        taxRate: json["tax_rate"] == null ? null : json["tax_rate"]!,
        subTotal: json["sub_total"] == null ? null : json["sub_total"]!,
        baseFare: json["base_fare"] == null ? null : json["base_fare"]!,
        userId: json["user_id"] == null ? null : json["user_id"]!,
        totalHelpers:
            json["total_helpers"] == null ? null : json["total_helpers"]!,
        days: json["days"] == null ? null : json["days"]!,
        status: json["status"] == null ? null : json["status"]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id!,
        "job_id": jobId == null ? null : jobId!,
        "total": total == null ? null : total!,
        "tax": tax == null ? null : tax!,
        "tax_rate": taxRate == null ? null : taxRate!,
        "sub_total": subTotal == null ? null : subTotal!,
        "base_fare": baseFare == null ? null : baseFare!,
        "user_id": userId == null ? null : userId!,
        "total_helpers": totalHelpers == null ? null : totalHelpers!,
        "days": days == null ? null : days!,
        "status": status == null ? null : status!,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class JobHelper {
  JobHelper({
    this.id,
    this.jobId,
    this.userId,
    this.helperId,
    this.status,
    this.jobCommentStatus,
    this.approvedBy,
    this.createdAt,
    this.updatedAt,
    this.helperProfile,
  });

  final int? id;
  final int? jobId;
  final int? userId;
  final int? helperId;
  final String? status;
  final String? jobCommentStatus;
  final String? approvedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final HelperrProfile? helperProfile;

  factory JobHelper.fromJson(Map<String, dynamic> json) => JobHelper(
        id: json["id"] == null ? null : json["id"]!,
        jobId: json["job_id"] == null ? null : json["job_id"]!,
        userId: json["user_id"] == null ? null : json["user_id"]!,
        helperId: json["helper_id"] == null ? null : json["helper_id"]!,
        status: json["status"] == null ? null : json["status"]!,
        jobCommentStatus: json["job_comment_status"] == null
            ? null
            : json["job_comment_status"]!,
        approvedBy: json["approved_by"] == null ? null : json["approved_by"]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        helperProfile: json["helper_profile"] == null
            ? null
            : HelperrProfile.fromJson(json["helper_profile"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id!,
        "job_id": jobId == null ? null : jobId!,
        "user_id": userId == null ? null : userId!,
        "helper_id": helperId == null ? null : helperId!,
        "status": status == null ? null : status!,
        "job_comment_status":
            jobCommentStatus == null ? null : jobCommentStatus!,
        "approved_by": approvedBy == null ? null : approvedBy!,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "helper_profile":
            helperProfile == null ? null : helperProfile!.toJson(),
      };
}

class HelperrProfile {
  HelperrProfile({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.image,
    this.accessToken,
    this.emailVerifiedAt,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.latitude,
    this.longitude,
    this.approved,
    this.approvedBy,
    this.govermentId,
    this.fcmToken,
    this.isVerified,
    this.apartment,
    this.city,
    this.province,
    this.country,
    this.imagePath,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? mobile;
  final String? image;
  final String? accessToken;
  final dynamic emailVerifiedAt;
  final int? status;
  final int? createdBy;
  final int? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic latitude;
  final dynamic longitude;
  final String? approved;
  final dynamic approvedBy;
  final int? govermentId;
  final String? fcmToken;
  final int? isVerified;
  final String? apartment;
  final String? city;
  final String? province;
  final String? country;
  final String? imagePath;

  factory HelperrProfile.fromJson(Map<String, dynamic> json) => HelperrProfile(
        id: json["id"] == null ? null : json["id"]!,
        name: json["name"] == null ? null : json["name"]!,
        email: json["email"] == null ? null : json["email"]!,
        mobile: json["mobile"] == null ? null : json["mobile"]!,
        image: json["image"] == null ? null : json["image"]!,
        accessToken:
            json["access_token"] == null ? null : json["access_token"]!,
        emailVerifiedAt: json["email_verified_at"],
        status: json["status"] == null ? null : json["status"]!,
        createdBy: json["created_by"] == null ? null : json["created_by"]!,
        updatedBy: json["updated_by"] == null ? null : json["updated_by"]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        approved: json["approved"] == null ? null : json["approved"]!,
        approvedBy: json["approved_by"],
        govermentId:
            json["goverment_id"] == null ? null : json["goverment_id"]!,
        fcmToken: json["fcm_token"] == null ? null : json["fcm_token"]!,
        isVerified: json["isVerified"] == null ? null : json["isVerified"]!,
        apartment: json["apartment"] == null ? null : json["apartment"]!,
        city: json["city"] == null ? null : json["city"]!,
        province: json["province"] == null ? null : json["province"]!,
        country: json["country"] == null ? null : json["country"]!,
        imagePath: json["imagePath"] == null ? null : json["imagePath"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id!,
        "name": name == null ? null : name!,
        "email": email == null ? null : email!,
        "mobile": mobile == null ? null : mobile!,
        "image": image == null ? null : image!,
        "access_token": accessToken == null ? null : accessToken!,
        "email_verified_at": emailVerifiedAt,
        "status": status == null ? null : status!,
        "created_by": createdBy == null ? null : createdBy!,
        "updated_by": updatedBy == null ? null : updatedBy!,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "latitude": latitude == null ? null : latitude!,
        "longitude": longitude == null ? null : longitude!,
        "approved": approved == null ? null : approved!,
        "approved_by": approvedBy,
        "goverment_id": govermentId == null ? null : govermentId!,
        "fcm_token": fcmToken == null ? null : fcmToken!,
        "isVerified": isVerified == null ? null : isVerified!,
        "apartment": apartment == null ? null : apartment!,
        "city": city == null ? null : city!,
        "province": province == null ? null : province!,
        "country": country == null ? null : country!,
        "imagePath": imagePath == null ? null : imagePath!,
      };
}
