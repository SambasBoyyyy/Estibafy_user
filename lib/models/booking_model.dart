// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromMap(jsonString);

import 'dart:convert';

class BookingModel {
  BookingModel({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  final int? success;
  final String? message;
  final List<dynamic>? error;
  final Data? data;

  factory BookingModel.fromJson(String str) =>
      BookingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookingModel.fromMap(Map<String, dynamic> json) => BookingModel(
        success: json["success"] == null ? null : json["success"]!,
        message: json["message"] == null ? null : json["message"]!,
        error: json["error"] == null
            ? null
            : List<dynamic>.from(json["error"].map((x) => x)),
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success!,
        "message": message == null ? null : message!,
        "error":
            error == null ? null : List<dynamic>.from(error!.map((x) => x)),
        "data": data == null ? null : data!.toMap(),
      };
}

class Data {
  Data({
    this.pending,
  });

  final List<Pending>? pending;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        pending: json["pending"] == null
            ? null
            : List<Pending>.from(
                json["pending"].map((x) => Pending.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "pending": pending == null
            ? null
            : List<dynamic>.from(pending!.map((x) => x.toMap())),
      };
}

class Pending {
  Pending(
      {this.id,
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
      this.paymentMethod});

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
  final Job? job;
  final dynamic paymentMethod;

  factory Pending.fromJson(String str) => Pending.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pending.fromMap(Map<String, dynamic> json) => Pending(
        id: json["id"] == null ? null : json["id"]!,
        jobId: json["job_id"] == null ? null : json["job_id"]!,
        total: json["total"] == null ? null : json["total"]!,
        tax: json["tax"] == null ? null : json["tax"]!,
        taxRate: json["tax_rate"] == null ? null : json["tax_rate"]!,
        subTotal: json["sub_total"] == null ? null : json["sub_total"]!,
        baseFare: json["base_fare"] == null ? null : json["base_fare"]!,
        userId: json["user_id"] == null ? null : json["user_id"]!,
        paymentMethod:
            json["payment_method"] == null ? null : json["payment_method"]!,
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
        job: json["job"] == null ? null : Job.fromMap(json["job"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id!,
        "job_id": jobId == null ? null : jobId!,
        "total": total == null ? null : total!,
        "tax": tax == null ? null : tax!,
        "tax_rate": taxRate == null ? null : taxRate!,
        "sub_total": subTotal == null ? null : subTotal!,
        "base_fare": baseFare == null ? null : baseFare!,
        "user_id": userId == null ? null : userId!,
        "payment_method": paymentMethod == null ? null : paymentMethod,
        "total_helpers": totalHelpers == null ? null : totalHelpers!,
        "days": days == null ? null : days!,
        "status": status == null ? null : status!,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "job": job == null ? null : job!.toMap(),
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
    this.packages,
    this.helpers,
    this.trackers,
    this.container,
    this.jobHelpers,
  });

  final int? id;
  final String? name;
  final String? address;
  final int? containerId;
  final String? packageType;
  final String? imageFile;
  final String? voiceFile;
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
  final List<dynamic>? packages;
  final List<Helper>? helpers;
  final List<dynamic>? trackers;
  final Containerr? container;
  List<JobHelper>? jobHelpers;

  factory Job.fromJson(String str) => Job.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Job.fromMap(Map<String, dynamic> json) => Job(
        id: json["id"] == null ? null : json["id"]!,
        name: json["name"] == null ? null : json["name"]!,
        address: json["address"] == null ? null : json["address"]!,
        containerId:
            json["container_id"] == null ? null : json["container_id"]!,
        packageType:
            json["package_type"] == null ? null : json["package_type"]!,
        imageFile: json["image_file"] == null ? null : json["image_file"]!,
        voiceFile: json["voice_file"] == null ? null : json["voice_file"]!,
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
        packages: json["packages"] == null
            ? null
            : List<dynamic>.from(json["packages"].map((x) => x)),
        helpers: json["helpers"] == null
            ? null
            : List<Helper>.from(json["helpers"].map((x) => Helper.fromJson(x))),
        trackers: json["trackers"] == null
            ? null
            : List<dynamic>.from(json["trackers"].map((x) => x)),
        container: json["container"] == null
            ? null
            : Containerr.fromMap(json["container"]),
        jobHelpers: json["job_helpers"] == null
            ? null
            : List<JobHelper>.from(
                json["job_helpers"].map((x) => JobHelper.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id!,
        "name": name == null ? null : name!,
        "address": address == null ? null : address!,
        "container_id": containerId == null ? null : containerId!,
        "package_type": packageType == null ? null : packageType!,
        "image_file": imageFile == null ? null : imageFile!,
        "voice_file": voiceFile == null ? null : voiceFile!,
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
        "packages": packages == null
            ? null
            : List<dynamic>.from(packages!.map((x) => x)),
        "helpers":
            helpers == null ? null : List<dynamic>.from(helpers!.map((x) => x)),
        "trackers": trackers == null
            ? null
            : List<dynamic>.from(trackers!.map((x) => x)),
        "container": container == null ? null : container!.toMap(),
      };
}

// enum Address { LAHORE, LAHORE_PAKISTAN, THE_101_HALL_ROAD_LAHORE }

// final addressValues = EnumValues({
//   "lahore": Address.LAHORE,
//   "Lahore, Pakistan": Address.LAHORE_PAKISTAN,
//   "101 hall road lahore": Address.THE_101_HALL_ROAD_LAHORE
// });

class Containerr {
  Containerr({
    this.id,
    this.name,
    this.helperSize,
    this.type,
    this.size,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final int? helperSize;
  final String? type;
  final int? size;
  final int? status;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Containerr.fromJson(String str) =>
      Containerr.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Containerr.fromMap(Map<String, dynamic> json) => Containerr(
        id: json["id"] == null ? null : json["id"]!,
        name: json["name"] == null ? null : json["name"]!,
        helperSize: json["helper_size"] == null ? null : json["helper_size"]!,
        type: json["type"] == null ? null : json["type"]!,
        size: json["size"] == null ? null : json["size"]!,
        status: json["status"] == null ? null : json["status"]!,
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id!,
        "name": name == null ? null : name!,
        "helper_size": helperSize == null ? null : helperSize!,
        "type": type == null ? null : type!,
        "size": size == null ? null : size!,
        "status": status == null ? null : status!,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Helper {
  Helper({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.image,
    this.accessToken,
    this.emailVerifiedAt,
    this.password,
    this.rememberToken,
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
  });

  int? id;
  String? name;
  String? email;
  String? mobile;
  String? image;
  String? accessToken;
  dynamic emailVerifiedAt;
  String? password;
  dynamic rememberToken;
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

  factory Helper.fromJson(Map<String, dynamic> json) => Helper(
        id: json["id"] ?? 0,
        name: json["name"] ?? null,
        email: json["email"] ?? '',
        mobile: json["mobile"] ?? '',
        image: json["image"] ?? '',
        accessToken: json["access_token"] ?? '',
        emailVerifiedAt: json["email_verified_at"],
        password: json["password"] ?? '',
        rememberToken: json["remember_token"],
        status: json["status"] ?? 0,
        createdBy: json["created_by"] ?? 0,
        updatedBy: json["updated_by"] ?? 0,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        latitude: json["latitude"] == 0.0 ? null : json["latitude"],
        longitude: json["longitude"] == null ? 0.0 : json["longitude"],
        approved: json["approved"] ?? '',
        approvedBy: json["approved_by"],
        govermentId: json["goverment_id"] ?? 0,
        fcmToken: json["fcm_token"] ?? '',
        isVerified: json["isVerified"] ?? 0,
        apartment: json["apartment"] ?? '',
        city: json["city"] ?? '',
        province: json["province"] ?? '',
        country: json["country"] ?? '',
      );
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

  factory JobHelper.fromJson(Map<String, dynamic> json) => JobHelper(
        id: json["id"] == null ? null : json["id"],
        jobId: json["job_id"] == null ? null : json["job_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        helperId: json["helper_id"] == null ? null : json["helper_id"],
        status: json["status"] == null ? null : json["status"],
        jobCommentStatus: json["job_comment_status"] == null
            ? null
            : json["job_comment_status"],
        jobCompletionStatus: json["job_completion_status"],
        approvedBy: json["approved_by"] == null ? null : json["approved_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "job_id": jobId == null ? null : jobId,
        "user_id": userId == null ? null : userId,
        "helper_id": helperId == null ? null : helperId,
        "status": status == null ? null : status,
        "job_comment_status":
            jobCommentStatus == null ? null : jobCommentStatus,
        "job_completion_status": jobCompletionStatus,
        "approved_by": approvedBy == null ? null : approvedBy,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

// enum ContainerName { CONTAINE_20_FEET, CONTAINE_40_FEET }
//
// final containerNameValues = EnumValues({
//   "Containe 20 feet": ContainerName.CONTAINE_20_FEET,
//   "Containe 40 feet": ContainerName.CONTAINE_40_FEET
// });
//
// enum JobName { JOB5, ABC, WANT_TO_UNLOAD_MY_CONTAINER }
//
// final jobNameValues = EnumValues({
//   "abc": JobName.ABC,
//   "job5": JobName.JOB5,
//   "Want to unload my container": JobName.WANT_TO_UNLOAD_MY_CONTAINER
// });
//
// enum PackageType { BOX, BOXES_PALETS }
//
// final packageTypeValues = EnumValues({
//   "box": PackageType.BOX,
//   "Boxes,palets": PackageType.BOXES_PALETS
// });
//
//
// final statusValues = EnumValues({
//   "pending": Status.PENDING
// });

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
