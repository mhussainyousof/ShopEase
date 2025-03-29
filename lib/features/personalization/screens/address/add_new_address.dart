import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class AddNewAddressScreeen extends StatelessWidget {
  const AddNewAddressScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(showBackArrow: true, title: Text('Add New Address')),

      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(
          TSizes.defaultSpace
        ),
        child: Form(child: Column(
          children: [
            TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
            SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number')),
            SizedBox(height: TSizes.spaceBtwInputFields),
            Row(children: [
              Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'))),
              SizedBox(width: TSizes.spaceBtwInputFields - 5),
              Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'))),
            ]),
            SizedBox(height: TSizes.spaceBtwInputFields),
            Row(children: [
              Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'))),
              SizedBox(width: TSizes.spaceBtwInputFields - 5),
              Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'))),
            ]),
            SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country')),
            SizedBox(height: TSizes.spaceBtwInputFields),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Save')),)
            

          ],
        )),
        ),
      ),
    );
  }
}