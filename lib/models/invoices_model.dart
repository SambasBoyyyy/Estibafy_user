// To parse this JSON data, do
//
//     final mapDiretionDataModel = mapDiretionDataModelFromJson(jsonString);

import 'dart:convert';

InvoiceModel mapDiretionDataModelFromJson(String str) =>
    InvoiceModel.fromJson(json.decode(str));

String mapDiretionDataModelToJson(InvoiceModel data) =>
    json.encode(data.toJson());

class InvoiceModel {
  InvoiceModel({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  int? success;
  String? message;
  List<dynamic>? error;
  List<Datum>? data;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
        success: json["success"],
        message: json["message"],
        error: List<dynamic>.from(json["error"].map((x) => x)),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": List<dynamic>.from(error!.map((x) => x)),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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
    this.job,
  });

  int? id;
  int? jobId;
  String? total;
  String? tax;
  String? taxRate;
  String? subTotal;
  String? baseFare;
  int? userId;
  int? totalHelpers;
  int? days;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Job? job;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        jobId: json["job_id"],
        total: json["total"],
        tax: json["tax"],
        taxRate: json["tax_rate"],
        subTotal: json["sub_total"],
        baseFare: json["base_fare"],
        userId: json["user_id"],
        totalHelpers: json["total_helpers"],
        days: json["days"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        job: Job.fromJson(json["job"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "job_id": jobId,
        "total": total,
        "tax": tax,
        "tax_rate": taxRate,
        "sub_total": subTotal,
        "base_fare": baseFare,
        "user_id": userId,
        "total_helpers": totalHelpers,
        "days": days,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "job": job!.toJson(),
      };
}

class Job {
  Job({
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
    this.container,
    this.jobHelpers,
  });

  int? id;
  String? name;
  String? address;
  int? containerId;
  String? packageType;
  String? imageFile;
  String? voiceFile;
  DateTime? startTime;
  DateTime? endTime;
  int? userId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic instructions;
  double? latitude;
  double? longitude;
  dynamic approvedBy;
  Containers? container;
  List<JobHelper>? jobHelpers;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        containerId: json["container_id"],
        packageType: json["package_type"],
        imageFile: json["image_file"] == null ? null : json["image_file"],
        voiceFile: json["voice_file"] == null ? null : json["voice_file"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        userId: json["user_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        instructions: json["instructions"],
        latitude: double.parse(json["latitude"]),
        longitude: double.parse(json["longitude"]),
        approvedBy: json["approved_by"],
        container: Containers.fromJson(json["container"]),
        jobHelpers: List<JobHelper>.from(
            json["job_helpers"].map((x) => JobHelper.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "container_id": containerId,
        "package_type": packageType,
        "image_file": imageFile == null ? null : imageFile,
        "voice_file": voiceFile == null ? null : voiceFile,
        "start_time": startTime!.toIso8601String(),
        "end_time": endTime!.toIso8601String(),
        "user_id": userId,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "instructions": instructions,
        "latitude": latitude,
        "longitude": longitude,
        "approved_by": approvedBy,
        "container": container!.toJson(),
        "job_helpers": List<dynamic>.from(jobHelpers!.map((x) => x.toJson())),
      };
}

class Containers {
  Containers({
    this.id,
    this.name,
    this.helperSize,
    this.type,
    this.size,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? helperSize;
  String? type;
  int? size;
  int? status;
  dynamic createdAt;
  DateTime? updatedAt;

  factory Containers.fromJson(Map<String, dynamic> json) => Containers(
        id: json["id"],
        name: json["name"],
        helperSize: json["helper_size"],
        type: json["type"],
        size: json["size"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "helper_size": helperSize,
        "type": type,
        "size": size,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt!.toIso8601String(),
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
    this.jobCompletionStatus,
    this.approvedBy,
    this.createdAt,
    this.updatedAt,
    this.helperProfile,
  });

  int? id;
  int? jobId;
  int? userId;
  int? helperId;
  String? status;
  String? jobCommentStatus;
  dynamic jobCompletionStatus;
  String? approvedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  HelperProfile? helperProfile;

  factory JobHelper.fromJson(Map<String, dynamic> json) => JobHelper(
        id: json["id"],
        jobId: json["job_id"],
        userId: json["user_id"],
        helperId: json["helper_id"],
        status: json["status"],
        jobCommentStatus: json["job_comment_status"],
        jobCompletionStatus: json["job_completion_status"],
        approvedBy: json["approved_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        helperProfile: json["helper_profile"] == null
            ? HelperProfile()
            : HelperProfile.fromJson(json["helper_profile"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "job_id": jobId,
        "user_id": userId,
        "helper_id": helperId,
        "status": status,
        "job_comment_status": jobCommentStatus,
        "job_completion_status": jobCompletionStatus,
        "approved_by": approvedBy,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "helper_profile": helperProfile!.toJson(),
      };
}

class HelperProfile {
  HelperProfile({
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

  int? id;
  String? name;
  String? email;
  String? mobile;
  String? image;
  String? accessToken;
  dynamic emailVerifiedAt;
  int? status;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? latitude;
  double? longitude;
  String? approved;
  dynamic approvedBy;
  int? govermentId;
  String? fcmToken;
  int? isVerified;
  String? apartment;
  String? city;
  String? province;
  String? country;
  String? imagePath;

  factory HelperProfile.fromJson(Map<String, dynamic> json) => HelperProfile(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        image: json["image"],
        accessToken: json["access_token"],
        emailVerifiedAt: json["email_verified_at"],
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        latitude: json["latitude"],
        longitude: json["longitude"],
        approved: json["approved"],
        approvedBy: json["approved_by"],
        govermentId: json["goverment_id"] == null ? null : json["goverment_id"],
        fcmToken: json["fcm_token"],
        isVerified: json["isVerified"],
        apartment: json["apartment"] == null ? null : json["apartment"],
        city: json["city"] == null ? null : json["city"],
        province: json["province"] == null ? null : json["province"],
        country: json["country"] == null ? null : json["country"],
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "image": image,
        "access_token": accessToken,
        "email_verified_at": emailVerifiedAt,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "latitude": latitude,
        "longitude": longitude,
        "approved": approved,
        "approved_by": approvedBy,
        "goverment_id": govermentId == null ? null : govermentId,
        "fcm_token": fcmToken,
        "isVerified": isVerified,
        "apartment": apartment == null ? null : apartment,
        "city": city == null ? null : city,
        "province": province == null ? null : province,
        "country": country == null ? null : country,
        "imagePath": imagePath,
      };
}
