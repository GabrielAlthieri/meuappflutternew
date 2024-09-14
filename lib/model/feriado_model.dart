class FeriadoEntity {
  String? id;
  String? name;
  String? description;
  String? startAt;

  FeriadoEntity({this.id, this.name, this.description, this.startAt});

  static FeriadoEntity fromJson(Map<String, dynamic> map) {
    return FeriadoEntity(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      startAt: map['startAt'],
    );
  }

  static Map<String, dynamic> toJson(FeriadoEntity FeriadoEntity) {
    Map<String, dynamic> json = {
      'name': FeriadoEntity.name,
      'description': FeriadoEntity.description,
      'startAt': FeriadoEntity.startAt
    };
    return json;
  }
}
