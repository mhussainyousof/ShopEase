import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/address/address_repository.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/features/personalization/models/address_model.dart';
import 'package:shop_ease/utils/helpers/network_manager.dart';
import 'package:shop_ease/utils/loaders/circular_loader.dart';
import 'package:shop_ease/utils/popups/full_screen_loader.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController postalCode = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController country = TextEditingController();


  RxBool refreshData = true.obs;

//! Form key for validation
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();


  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
            (element) => element.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Address not found',
        message: e.toString(),
      );
      return [];
    }
  }
  Future<void> selectAddress(AddressModel newSelectedAddress) async {
    try {

      Get.defaultDialog(
        title: '',
        onWillPop: ()async {return false;},
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: TCircularLoader(),
      );
      // Clear the "selected" field from previously selected address

      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }

      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the "selected" field to true for the newly selected address
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);
      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Error in Selection',
          message: e.toString()
      );
    }
  }


  Future<void> addNewAddress() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Storing Address...', 'Images.docerAnimation');

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'No Internet Connection',
            message: 'Please check your connection and try again'
        );
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Create Address Model
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );

      // Save to Repository
      final id = await addressRepository.addAddress(address);

      // Update Selected Address status
      address.id = id;
      await selectAddress(address);

      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully.'
      );

      // Refresh Addresses Data
      refreshData.toggle();

      // Reset form fields
      resetFormField();

      // Navigate back
      Get.back();
    } catch (e) {
      // Error Handling
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: 'Address Save Failed',
          message: e.toString()
      );
    }
  }


  void resetFormField(){
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}