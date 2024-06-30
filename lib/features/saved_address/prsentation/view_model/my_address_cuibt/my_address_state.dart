part of 'my_address_cubit.dart';


sealed class MyAddressState {}

final class MyAddressInitial extends MyAddressState {}
final class MyAddressLoading extends MyAddressState {}
final class MyAddressFailure extends MyAddressState 
{
  final String message;

  MyAddressFailure({required this.message});
}
final class MyAddressSucess extends MyAddressState 
{
  final List<AddressModel> address;

  MyAddressSucess({required this.address});
}

