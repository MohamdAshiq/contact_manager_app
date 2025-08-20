import 'package:contact_manager_app/models/screen_mode.dart';
import 'package:contact_manager_app/provider/contacts_provider.dart';
import 'package:contact_manager_app/provider/theme_provider.dart';
import 'package:contact_manager_app/screens/add_or_edit_screen.dart';
import 'package:contact_manager_app/screens/contact_details_screen.dart';
import 'package:contact_manager_app/widgets/empty_contacts_message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Manager"),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, value, child) => IconButton(
              onPressed: () => value.toggleTheme(),
              icon: Icon(
                value.isDark ? Icons.dark_mode : Icons.light_mode,
                size: 25,
              ),
            ),
          ),
          SizedBox(width: 7),
        ],
      ),
      body: SafeArea(
        child: Consumer<ContactsProvider>(
          builder: (context, value, _) => value.isloading
              ? Center(child: CircularProgressIndicator())
              : value.contacts.isNotEmpty
              ? Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CupertinoSearchTextField(
                        placeholder: "Search Contacts",
                        padding: EdgeInsetsGeometry.symmetric(
                          vertical: 17,
                          horizontal: 20,
                        ),
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.apply(fontSizeDelta: 1),
                        prefixInsets: EdgeInsets.only(left: 15),
                        suffixInsets: EdgeInsets.only(right: 10),
                        onChanged: (value) => context
                            .read<ContactsProvider>()
                            .setSearchQuery(value),
                      ),
                    ),
                    Expanded(
                      child: value.filteredContacts.isNotEmpty
                          ? ListView.builder(
                              padding: EdgeInsets.all(10),
                              itemCount: value.filteredContacts.length,
                              itemBuilder: (context, index) => ListTile(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ContactDetailsScreen(
                                      contactId:
                                          value.filteredContacts[index].id!,
                                    ),
                                  ),
                                ),
                                minTileHeight: 75,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                leading: Hero(
                                  tag:
                                      "profile_icon_${value.filteredContacts[index].id}",
                                  child: Icon(Icons.account_circle, size: 42),
                                ),
                                minLeadingWidth: 50,
                                contentPadding: EdgeInsets.only(
                                  left: 15,
                                  top: 5,
                                  bottom: 5,
                                ),
                                title: Text(
                                  "${value.filteredContacts[index].firstName} ${value.filteredContacts[index].lastName}",
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    value.filteredContacts[index].email,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 20,
                                ),
                              ),
                            )
                          : Center(
                              child: Text(
                                "No Match found..!!",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                    ),
                  ],
                )
              : EmptyContactsMessageWidget(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddOrEditScreen(screenMode: ScreenMode.add),
          ),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
