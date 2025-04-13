import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/features/personalization/controllers/update_name_controller.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'package:shop_ease/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the controller for managing name change logic
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true, // Add a back arrow to the app bar
        title: Text(
          'Change Name', // Title of the page
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace), // Padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligning text to the left
          children: [
            Text('Use real name for easy verification'), // Instructions for user
            SizedBox(height: TSizes.spaceBtwSections), // Space between elements
            Form(
              key: controller.updateUserNameFormKey, // Form validation key
              child: Column(
                children: [
                  // Text field for the first name
                  TextFormField(
                    controller: controller.firstName, // Controller for managing the input
                    validator: (value) => EValidator.validateEmptyText('FirstName', value), // Validation for non-empty first name
                    decoration: InputDecoration(
                      labelText: TTexts.firstName, // Label for the text field
                      prefixIcon: Icon(Iconsax.user), // Icon for the text field
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems), // Space between text fields
                  // Text field for the last name
                  TextFormField(
                    controller: controller.lastName, // Controller for managing the input
                    validator: (value) => EValidator.validateEmptyText('LastName', value), // Validation for non-empty last name
                    decoration: InputDecoration(
                      labelText: TTexts.lastName, // Label for the text field
                      prefixIcon: Icon(Iconsax.user), // Icon for the text field
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections), // Space between elements
            SizedBox(
              width: double.infinity, // Make the button full width
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(), // Call the update function when button is pressed
                child: Text('Save'), // Button text
              ),
            ),
          ],
        ),
      ),
    );
  }
}

