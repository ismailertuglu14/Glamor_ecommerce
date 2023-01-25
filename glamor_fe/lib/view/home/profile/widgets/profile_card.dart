import 'package:client/core/extension/context_extension.dart';
import 'package:client/core/init/navigation/navigation_service.dart';
import 'package:client/product/utility/custom_padding.dart';
import 'package:client/view/home/profile/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});
  final String _userMail = 'ismailertgl@gmail.com';
  final String _userName = 'İsmail Ertuglu';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 6,
      child: GestureDetector(
        onTap: () =>
            NavigationService.instance.navigateToPage(path: '/profileDetail'),
        child: Card(
          shape: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45)),
          child: Padding(
            padding: const CustomPadding.paddingLow(),
            child: Row(children: [
              const Expanded(flex: 2, child: UserCircleAvatar()),
              Expanded(
                flex: 5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(_userName,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                      Text(_userMail,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary))
                    ]),
              ),
              const Expanded(flex: 2, child: Icon(Icons.person_outline))
            ]),
          ),
        ),
      ),
    );
  }
}
