part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class GetAllDateEvent extends SettingsEvent {}

class CreateNewMonthEvent extends SettingsEvent {
  final DateModel dateModel;
  const CreateNewMonthEvent({required this.dateModel});
}

class SetMonthEvent extends SettingsEvent {
  final DateModel dateModel;
  const SetMonthEvent({required this.dateModel});
}
