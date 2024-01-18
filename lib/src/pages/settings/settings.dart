import 'package:flutter/material.dart';
import 'package:onlydigital/src/config/custom_colors.dart';
import 'package:onlydigital/src/pages/common_widgets/custom_text_filds.dart';
import 'package:onlydigital/src/config/app_data.dart' as app_data;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Teko',
            fontSize: 32,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_rounded,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        physics: const BouncingScrollPhysics(),
        children: [
          //Name
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.name,
            icon: Icons.person,
            label: 'Name',
          ),
          //Email
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.email,
            icon: Icons.mail,
            label: 'Email',
          ),

          //CPF
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.cpf,
            icon: Icons.file_copy,
            label: 'SSN or CPF',
            isSecret: true,
          ),

          //Cellphone
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.celphone,
            icon: Icons.phone,
            label: 'Cellphone',
          ),

          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.password,
            icon: Icons.lock,
            label: 'Password',
          ),

          //Button att password
          OutlinedButton(
            onPressed: () {
              updatePassword();
            },
            child: const Text(
              'Edit password',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: CustomColors.customSwatchColor,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Title
                      const Text(
                        'Change password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Teko',
                          fontSize: 38,
                        ),
                      ),

                      //Forms
                      const CustomTextField(
                        icon: Icons.lock,
                        label: 'Current Password',
                      ),
                      const CustomTextField(
                        isSecret: true,
                        icon: Icons.lock_outline,
                        label: 'New Password',
                      ),
                      const CustomTextField(
                        isSecret: true,
                        icon: Icons.lock_outline,
                        label: 'Reenter new Password',
                      ),

                      //Confirmation Button
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Confirm changes',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
