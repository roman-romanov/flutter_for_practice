import 'package:json_annotation/json_annotation.dart';
import 'address.dart';

part 'human.g.dart';

@JsonSerializable()
class Human {
  // @JsonKey можно применить, если например имя('name') не соответствует 
  // свойству name. Может прийти например 'first_name'
  //@JsonKey(name:'first_name')
  String name;
  String surname;
  int age;
  List<Address> addreses;
  Human({
    required this.name,
    required this.surname,
    required this.age,
    required this.addreses,
  });

  factory Human.fromJson(Map<String, dynamic> json) => _$HumanFromJson(json);

  // factory Human.fromJson(Map<String, dynamic> json) {
  //   return Human(
  //     name: json['name'] as String,
  //     surname: json['surname'] as String,
  //     age: json['age'] as int,
  //     addreses: (json['addreses'] as List<dynamic>)
  //         .map((e) => Address.fromJson(e as Map<String, dynamic>))
  //         .toList(),
  //   );
  // }

  Map<String, dynamic> toJson() => _$HumanToJson(this);

  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'surname': surname,
  //     'age': age,
  //     'addreses': addreses.map((e) => e.toJson()).toList(),
  //   };
  // }
}
