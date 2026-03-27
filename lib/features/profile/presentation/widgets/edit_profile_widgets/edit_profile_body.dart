import 'package:flutter/material.dart';
import 'edit_section.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          EditSection(),
        ],
      ),
    );
  }
}
