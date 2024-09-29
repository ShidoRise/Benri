import 'package:benri/features/conviStore/screens/basket_page.dart';
import 'package:benri/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: BColors.light,
          indicatorColor: BColors.grey,
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.bag_2), label: 'Basket'),
            NavigationDestination(
                icon: Icon(Iconsax.external_drive), label: 'Fridge'),
            NavigationDestination(
                icon: Icon(Iconsax.reserve), label: 'Recipes'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const BasketPage(),
    Container(color: Colors.purple),
    Container(color: Colors.grey),
    Container(color: Colors.brown),
  ];
}
