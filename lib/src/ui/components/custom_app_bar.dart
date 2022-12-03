import 'package:flutter/material.dart';

import '../screen/home_body/home_body.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://img4.thuthuatphanmem.vn/uploads/2020/12/25/anh-bia-bong-da_105530475.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 96, 95, 93),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: ChooseTimeBar(),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
      centerTitle: true,
      title: SizedBox(
        height: 60,
        child: Image.asset(
          'assets/image/logo_wc.png',
          fit: BoxFit.cover,
        ),
      ),

      // title:  ,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
