import 'package:dashboad/features/create_account/data/models/usermodel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel{
  @JsonKey(name: "birth_date")
  String birth_date;
  @JsonKey(name: "age")
  String age;
  @JsonKey(name: "gender")
  String gender;
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "blood_type")
  String blood_type;
  @JsonKey(name: "marital_status")
  String marital_status;
  @JsonKey(name: "children_num")
  int children_num;
  @JsonKey(name: "habits")
  String habits;
  @JsonKey(name: "proffesion")
  String proffesion;
  @JsonKey(name: "diabetes")
  bool diabetes;
  @JsonKey(name: "blood_pressure")
  bool blood_pressure;
  @JsonKey(name: "wallet")
  double wallet;
  @JsonKey(name: "user")
  Usermodel user;


  PatientModel(this.birth_date,this.age,this.gender,this.address,this.blood_type,this.marital_status,
      this.children_num,this.habits,this.proffesion,this.diabetes,this.blood_pressure,
      this.wallet,this.user);

  factory PatientModel.fromJson(Map<String,dynamic>json)=>_$PatientModelFromJson(json);

  Map<String,dynamic> ToJson()=>_$PatientModelToJson(this);


}




