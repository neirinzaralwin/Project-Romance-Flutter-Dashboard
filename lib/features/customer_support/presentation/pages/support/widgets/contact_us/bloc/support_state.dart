import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:project_romance/features/customer_support/domain/entities/contact/contact_entity.dart';

abstract class SupportState extends Equatable {
  final List<ContactEntity>? contacts;
  final DioException? exception;

  const SupportState({this.contacts, this.exception});

  @override
  List<Object> get props => [contacts!, exception!];
}

class SupportLoading extends SupportState {
  const SupportLoading();
}

// class SupportDone extends SupportState {
//   const SupportDone();
// }

class AllContactsLoading extends SupportState {
  const AllContactsLoading();
}

class AllContactsSuccess extends SupportState {
  const AllContactsSuccess(List<ContactEntity> contacts)
      : super(contacts: contacts);
}

class AllContactsError extends SupportState {
  const AllContactsError(DioException exception) : super(exception: exception);
}

// create contact states
class ContactCreationLoading extends SupportState {
  const ContactCreationLoading();
}

class ContactCreationSuccess extends SupportState {
  const ContactCreationSuccess();
}

class ContactCreationError extends SupportState {
  const ContactCreationError(DioException exception)
      : super(exception: exception);
}

// class AboutUsLoading extends SupportState {
//   const AboutUsLoading();
// }

// class AboutUsSuccess extends SupportState {
//   const AboutUsSuccess(AboutUsEntity aboutUs)
//       : super(aboutUs: aboutUs);
// }

// class AboutUsError extends SupportState {
//   const AboutUsError(DioException exception) : super(exception: exception);
// }
