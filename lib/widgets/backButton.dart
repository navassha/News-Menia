import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_menia/extensions/responsive.size.dart';

class ModiFiedBackButton extends StatelessWidget {
  const ModiFiedBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: context.width(50),
        height: context.width(50),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 15, 34, 49),
          borderRadius: BorderRadius.circular(
            context.width(15),
          ),
        ),
        child: Center(
          child: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.white,
            size: context.width(25),
          ),
        ),
      ),
    );
  }
}
