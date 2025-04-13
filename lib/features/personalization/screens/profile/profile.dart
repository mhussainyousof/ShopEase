import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/images/circular_image.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/features/personalization/controllers/user_controller.dart';
import 'package:shop_ease/features/personalization/screens/changeName/change_name_screen.dart';
import 'package:shop_ease/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: MyAppBar(

        showBackArrow: true,
        title: Text('Profile'),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            child: Column( 
              children: [
                ECircularImage(image: TImages.user, width: 80, height: 80,),
                TextButton(onPressed: (){}, child: Text('Change Profile Picture')),
            
              ],
            ),
          ),
SizedBox(height: TSizes.spaceBtwItems / 2),
Divider(),
SizedBox(height: TSizes.spaceBtwItems),
EProfileMenu( title: 'Name', value: controller.userModel.value.fullName,onPressed: ()=>Get.to(()=> ChangeName())),
EProfileMenu(onPressed: (){}, title: 'UserName', value: controller.userModel.value.username),
Divider(),
SizedBox(height: TSizes.spaceBtwItems),





RowTextButton(title: 'Profile Information'),
SizedBox(height: TSizes.spaceBtwItems),
EProfileMenu(title: 'User ID', value: controller.userModel.value.id, onPressed: (){}, icon: Iconsax.copy,),
EProfileMenu(title: 'Email', value: controller.userModel.value.email, onPressed: (){},),
EProfileMenu(title: 'PhoneNumber', value: controller.userModel.value.phoneNumber, onPressed: (){},),
EProfileMenu(title: 'Gender', value: 'Male', onPressed: (){},),
EProfileMenu(title: 'Date of Birth', value: '10, Oct, 2000', onPressed: (){},),
Divider(),
SizedBox(height: TSizes.spaceBtwItems),

Center(
  child:
  TextButton(
    onPressed:(){},
    child: Text('Close Account', style: TextStyle(color: Colors.red),)
  )
)
        ]),
      ),
    );
  }
}


