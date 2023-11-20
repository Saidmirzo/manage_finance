import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:manage_finance/core/db/db_helper.dart';
import 'package:manage_finance/features/settings/models/date_model.dart';
import 'package:manage_finance/injection_container.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final DBHelper dbHelper;
  DateModel? dateModel;
  List<DateModel>? listDates;
  SettingsBloc(this.dbHelper) : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {});
    
    on<GetAllDateEvent>(
      (event, emit) async {
        emit(SettingsLoadingState());
        final response = await dbHelper.getAllDates();
        dateModel = response[0];
        listDates = response;
        dbHelper.restartDateId(dateID: dateModel!.id ?? 1);
        emit(SettingsLoadedState());
      },
    );
    on<SetMonthEvent>(
      (event, emit) {
        emit(SettingsLoadingState());
        dateModel = event.dateModel;
        dbHelper.restartDateId(dateID: event.dateModel.id ?? 1);
        emit(SettingsLoadedState());
      },
    );
    on<CreateNewMonthEvent>(
      (event, emit) async{
        await dbHelper.createNewMonth(event.dateModel, dateModel!);
        add(GetAllDateEvent());
      },
    );
  }
}
