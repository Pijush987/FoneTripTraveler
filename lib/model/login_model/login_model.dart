import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_model.freezed.dart';
part 'login_model.g.dart';
@freezed
class LoginModel with _$LoginModel {
  factory LoginModel({
    @Default('') String token,
    @Default('') String error
}) = _LoginModel;

  factory LoginModel.fromJson(Map<String,dynamic> json) => _$LoginModelFromJson(json);
}