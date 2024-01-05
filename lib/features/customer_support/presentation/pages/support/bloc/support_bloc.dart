import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/core/resources/logger.dart';
import 'package:project_romance/features/customer_support/domain/usecases/create_contact.dart';
import 'package:project_romance/features/customer_support/domain/usecases/get_all_contacts.dart';
import 'support_event.dart';
import 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final GetAllContactsUseCase _getAllContactsUseCase;
  final CreateContactUseCase _createContactUseCase;

  SupportBloc(this._getAllContactsUseCase, this._createContactUseCase)
      : super(const AllContactsLoading()) {
    on<GetAllContactsEvent>(onGetAllContact);
    on<CreateContactEvent>(onCreateContact);
  }

  void onGetAllContact(
      GetAllContactsEvent event, Emitter<SupportState> emit) async {
    emit(const AllContactsLoading());
    final dataState = await _getAllContactsUseCase();
    if (dataState is DataSuccess) {
      Logger.Green.log("✅ fetching all contacts");
      emit(AllContactsSuccess(dataState.data ?? []));
    }
    if (dataState is DataFailed) {
      emit(AllContactsError(dataState.error!));
    }
  }

  void onCreateContact(
      CreateContactEvent event, Emitter<SupportState> emit) async {
    emit(const ContactCreationLoading());
    final dataState = await _createContactUseCase(event.request);

    if (dataState is DataSuccess) {
      Logger.Green.log("✅ Contact created successfully");
      emit(const ContactCreationSuccess());
    } else if (dataState is DataFailed) {
      emit(ContactCreationError(dataState.error!));
    }
  }
}
