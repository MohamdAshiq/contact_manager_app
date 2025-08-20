import 'package:contact_manager_app/models/screen_mode.dart';
import 'package:contact_manager_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddOrEditScreen extends StatelessWidget {
  const AddOrEditScreen({super.key, required this.screenMode});

  final ScreenMode screenMode;

  @override
  Widget build(BuildContext context) {
    final bool isEditScreen = screenMode == ScreenMode.edit;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(isEditScreen ? "Edit Contact" : "Add Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 15,
          children: [
            SizedBox(),
            CustomTextFormField(labelText: "First Name", icon: Icons.person),
            CustomTextFormField(labelText: "Last Name", icon: Icons.person),
            CustomTextFormField(
              labelText: "Email",
              icon: Icons.email,
              textInputType: TextInputType.emailAddress,
            ),
            CustomTextFormField(
              labelText: "Phone No",
              icon: Icons.phone,
              textInputType: TextInputType.phone,
            ),
            SizedBox(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(isEditScreen ? "Save Changes" : "Add Contact"),
            ),
          ],
        ),
      ),
    );
  }
}
