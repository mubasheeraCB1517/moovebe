class DriverList {
  List<Driver>? driver_list;
  bool? status;

  DriverList({this.driver_list, this.status});

  factory DriverList.fromJson(Map<String, dynamic> json) {
    return DriverList(
      driver_list: json['driver_list'] != null
          ? (json['driver_list'] as List)
              .map((i) => Driver.fromJson(i))
              .toList()
          : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.driver_list != null) {
      data['driver_list'] = this.driver_list?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Driver {
  int? id;
  String? license_no;
  String? mobile;
  String? name;

  Driver({this.id, this.license_no, this.mobile, this.name});

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'],
      license_no: json['license_no'],
      mobile: json['mobile'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['license_no'] = this.license_no;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    return data;
  }
}
