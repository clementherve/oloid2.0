import 'dart:math';

import 'package:flutter/material.dart';

import '../widget/email.dart';
import '../widget/email_header.dart';

class Emails extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  Emails({Key? key}) : super(key: key);

  void jumpToTop() {
    scrollController.animateTo(
      0,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: RefreshIndicator(
          child: ListView.custom(
            controller: scrollController,
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              if (index == 0) {
                return EmailHeader(
                  createEmail: () {},
                  searchEmail: (String query) async {},
                );
              } else if (index < 150) {
                return Email(
                  subject: "Le sujet du mail",
                  sender: "hello@mail.com",
                  excerpt:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  isRead: Random().nextBool(),
                  date: DateTime.now()
                      .add(Duration(hours: -(Random().nextInt(15)))),
                );
              }
              return null;
            }),
          ),
          onRefresh: () async {},
        ));
  }
}