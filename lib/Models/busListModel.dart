class BusList {
    List<Bus>? bus_list;
    bool? status;

    BusList({this.bus_list, this.status});

    factory BusList.fromJson(Map<String, dynamic> json) {
        return BusList(
            bus_list: json['bus_list'] != null ? (json['bus_list'] as List).map((i) => Bus.fromJson(i)).toList() : null,
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status'] = this.status;
        if (this.bus_list != null) {
            data['bus_list'] = this.bus_list?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Bus {
    int? driver;
    int? id;
    String? image;
    String? name;
    String? seat_count;
    String? type;

    Bus({this.driver, this.id, this.image, this.name, this.seat_count, this.type});

    factory Bus.fromJson(Map<String, dynamic> json) {
        return Bus(
            driver: json['driver'] != null ? json['driver'] : null,
            id: json['id'],
            image: json['image'],
            name: json['name'],
            seat_count: json['seat_count'],
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['image'] = this.image;
        data['name'] = this.name;
        data['seat_count'] = this.seat_count;
        data['type'] = this.type;
        if (this.driver != null) {
            data['driver'] = this.driver;
        }
        return data;
    }
}