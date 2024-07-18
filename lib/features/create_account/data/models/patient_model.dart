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




/*{
    "data": {
        "birth_date": "2024-07-17",
        "age": "string",
        "gender": "male",
        "address": "string",
        "blood_type": "string",
        "marital_status": "single",
        "children_num": 0,
        "habits": "string",
        "proffesion": "string",
        "diabetes": true,
        "blood_pressure": true,
        "wallet": 0,
        "user_id": 94,
        "id": 31,
        "user": {
            "id": 94,
            "first_name": "string",
            "middle_name": "string",
            "last_name": "string",
            "phone_number": "sssssss",
            "user_type": "patient",
            "image": null,
            "description": "string",
            "remember_token": null
        }
    },
    "message": "created successfully"
}*/