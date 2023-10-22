part of 'register_bloc.dart';

class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterDataEvent extends RegisterEvent {
  final String name;
  final String phone;
  final String deviceName;

  const RegisterDataEvent({
    required this.name,
    required this.phone,
    required this.deviceName,
  });
  @override
  List<Object> get props => [name, phone, deviceName];
}
