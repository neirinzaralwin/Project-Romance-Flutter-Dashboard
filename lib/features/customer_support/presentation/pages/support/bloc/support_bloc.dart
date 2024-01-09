import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/core/resources/logger.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';
import 'package:project_romance/features/customer_support/domain/usecases/create_contact.dart';
import 'package:project_romance/features/customer_support/domain/usecases/delete_contact.dart';
import 'package:project_romance/features/customer_support/domain/usecases/get_all_contacts.dart';
import 'package:project_romance/features/customer_support/domain/usecases/update_contact.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/support_layout.dart';
import 'support_event.dart';
import 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final GetAllContactsUseCase _getAllContactsUseCase;
  final CreateContactUseCase _createContactUseCase;
  final DeleteContactUseCase _deleteContactUseCase;
  final UpdateContactUseCase _updateContactUseCase;

  SupportBloc(this._getAllContactsUseCase, this._createContactUseCase,
      this._deleteContactUseCase, this._updateContactUseCase)
      : super(const AllContactsLoading()) {
    on<GetAllContactsEvent>(onGetAllContact);
    on<CreateContactEvent>(onCreateContact);
    on<DeleteContactEvent>(onDeleteContact);
    on<UpdateContactEvent>(onUpdateContact);
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
      Logger.Red.log("Error in getAllContacts ❌, reason ${dataState.error}");
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
      // toast
      GFToast.showToast('Created a contact successfully',
          SupportLayout.supportLayoutKey.currentContext!,
          backgroundColor: AppColor.greenDark,
          textStyle: bodyMedium.copyWith(
            color: AppColor.white,
          ),
          toastPosition: GFToastPosition.BOTTOM);
      add(const GetAllContactsEvent());
    } else if (dataState is DataFailed) {
      Logger.Red.log("Error in createContact ❌, reason ${dataState.error}");
      emit(ContactCreationError(dataState.error!));
    }
  }

  void onDeleteContact(
      DeleteContactEvent event, Emitter<SupportState> emit) async {
    emit(const AllContactsLoading());
    final dataState = await _deleteContactUseCase(event.id);
    if (dataState is DataSuccess) {
      Logger.Green.log("✅ delete a contact successfully");
      // toast
      GFToast.showToast('Delete contact successfully',
          SupportLayout.supportLayoutKey.currentContext!,
          textStyle: bodyMedium.copyWith(
            color: AppColor.white,
          ),
          toastPosition: GFToastPosition.BOTTOM);
      add(const GetAllContactsEvent());
    }
    if (dataState is DataFailed) {
      Logger.Red.log("Error in deleteContact ❌, reason ${dataState.error}");
    }
  }

  void onUpdateContact(
      UpdateContactEvent event, Emitter<SupportState> emit) async {
    emit(const AllContactsLoading());
    final dataState =
        await _updateContactUseCase(UpdateContactParams(event.id, event.value));
    if (dataState is DataSuccess) {
      Logger.Green.log("✅ update a contact successfully");
      // toast
      GFToast.showToast('Update contact successfully',
          SupportLayout.supportLayoutKey.currentContext!,
          backgroundColor: AppColor.greenDark,
          textStyle: bodyMedium.copyWith(
            color: AppColor.white,
          ),
          toastPosition: GFToastPosition.BOTTOM);
      add(const GetAllContactsEvent());
    }
    if (dataState is DataFailed) {
      Logger.Red.log("Error in updateContact ❌, reason ${dataState.error}");
    }
  }
}
