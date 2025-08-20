import 'package:contact_manager_app/models/contact_model.dart';
import 'package:contact_manager_app/models/screen_mode.dart';
import 'package:contact_manager_app/provider/contacts_provider.dart';
import 'package:contact_manager_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddOrEditScreen extends StatefulWidget {
  const AddOrEditScreen({super.key, required this.screenMode});

  final ScreenMode screenMode;

  @override
  State<AddOrEditScreen> createState() => _AddOrEditScreenState();
}

class _AddOrEditScreenState extends State<AddOrEditScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNoController;

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNoController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isEditScreen = widget.screenMode == ScreenMode.edit;
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
            CustomTextFormField(
              labelText: "First Name",
              icon: Icons.person,
              controller: firstNameController,
            ),
            CustomTextFormField(
              labelText: "Last Name",
              icon: Icons.person,
              controller: lastNameController,
            ),
            CustomTextFormField(
              labelText: "Email",
              icon: Icons.email,
              controller: emailController,
              textInputType: TextInputType.emailAddress,
            ),
            CustomTextFormField(
              labelText: "Phone No",
              icon: Icons.phone,
              controller: phoneNoController,
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
              onPressed: isEditScreen
                  ? () {}
                  : () {
                      context.read<ContactsProvider>().addNewContact(
                        ContactModel(
                          name:
                              firstNameController.text.trim() +
                              lastNameController.text.trim(),
                          phoneNo: phoneNoController.text.trim(),
                          email: emailController.text.trim(),
                        ),
                      );
                      Navigator.pop(context);
                    },
              child: Text(isEditScreen ? "Save Changes" : "Add Contact"),
            ),
          ],
        ),
      ),
    );
  }
}
