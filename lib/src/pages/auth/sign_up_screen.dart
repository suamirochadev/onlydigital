import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:onlydigital/src/pages/common_widgets/custom_text_filds.dart';
import 'package:onlydigital/src/config/custom_colors.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      '#': RegExp(
        r'[0-9]',
      ),
    },
  );
  final celularFormatter = MaskTextInputFormatter(
    mask: '## ## # ####-####',
    filter: {
      '#': RegExp(
        r'[0-9]',
      ),
    },
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      'Create your free account',
                      style: TextStyle(
                          fontFamily: 'Teko',
                          fontSize: 40,
                          color: Colors.black),
                    ),
                  ),
                ),
                //Formulario
                Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(45))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const CustomTextField(
                            icon: Icons.person,
                            label: 'Name',
                          ),
                          CustomTextField(
                            icon: Icons.file_copy_rounded,
                            label: 'Individual Taxpayer Registration',
                            inputFormatters: [cpfFormatter],
                          ),
                          CustomTextField(
                            icon: Icons.phone,
                            label: 'Cell phone',
                            inputFormatters: [celularFormatter],
                          ),
                          const CustomTextField(
                            icon: Icons.mail,
                            label: 'Email',
                          ),
                          const CustomTextField(
                            icon: Icons.lock,
                            label: 'Password',
                            isSecret: true,
                          ),
                          SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        CustomColors.customSwatchColor.shade900,
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Create account',
                                    style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  )))
                        ])),
              ]),
              Positioned(
                left: 16,
                top: 16,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
