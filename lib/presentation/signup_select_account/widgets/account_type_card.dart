import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/signup_select_account/controller/signup_select_account_controller.dart';
import 'package:flutter/material.dart';

class AccountTypeCard extends StatelessWidget {
  final AccountType accountType;
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  AccountTypeCard(
      {required this.accountType,
      required this.title,
      required this.description,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AccountTypeController>();
    return Obx(() => GestureDetector(
          onTap: () => controller.selectType(accountType),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: controller.selectedType.value == accountType
                  ? color
                  : Colors.transparent,
              border: Border.all(
                color: color,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontSize: 20,
                        color: controller.selectedType.value == accountType
                            ? theme.colorScheme.background
                            : theme.colorScheme.onBackground,
                      ),
                    ),
                    SizedBox(
                      width: 8.h,
                    ),
                    Icon(
                      icon,
                      color: controller.selectedType.value == accountType
                          ? Colors.white
                          : color,
                    )
                  ],
                ),
                SizedBox(
                  height: 12.v,
                ),
                Text(
                  description,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: controller.selectedType.value == accountType
                        ? Colors.white
                        : Colors.black,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
