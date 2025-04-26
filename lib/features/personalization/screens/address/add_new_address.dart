import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/features/personalization/controllers/address_controller.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/validators/validation.dart';
class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('Add New Address', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                // Name Field
                TextFormField(
                  controller: controller.name,
                  validator: (value) => EValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: 'Name'
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),

                // Phone Number Field
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: EValidator.validatePhoneNumber,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number'
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),

                // Street and Postal Code Row
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) => EValidator.validateEmptyText('Street', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),
                            labelText: 'Street'
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields - 5),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) => EValidator.validateEmptyText('Postal Card',value),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: 'Postal Code'
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),

                // City and State Row
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) => EValidator.validateEmptyText('City', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: 'City'
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields - 5),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) => EValidator.validateEmptyText('State', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: 'State'
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),

                // Country Field
                TextFormField(
                  controller: controller.country,
                  validator: (value) => EValidator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global),
                      labelText: 'Country'
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}