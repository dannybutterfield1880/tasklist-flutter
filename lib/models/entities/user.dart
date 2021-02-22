import 'package:json_annotation/json_annotation.dart';
import 'package:tasklist/utils/converters/CustomDateTimeConverter.dart';
import '../base_model.dart';

part 'user.g.dart';

@JsonSerializable(nullable: false)
@CustomDateTimeConverter()
class User extends BaseModel  {
  final int id;
  final String firstName;
  final String lastName;
  final DateTime dob;
  final String gender;
  final String email;

  User({ this.id, this.firstName, this.lastName, this.dob, this.gender, this.email });

   @override
  List<Object> get props => [id, firstName, lastName, dob, gender, email];
  
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserToJson(this);
}