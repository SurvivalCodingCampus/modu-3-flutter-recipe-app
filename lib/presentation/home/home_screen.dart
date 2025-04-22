import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/search_field.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';
import 'package:recipe_app/presentation/component/navigation_bar_widget.dart';

import '../../core/routing/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    const String imagePath =
        'https://s3-alpha-sig.figma.com/img/c492/e0dc/4e79c0324e16a6e05cb4555a0dd25e28?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=F7STokLKXQ1stIE5Ki~-yYXbd9ZbVH1cVV~8wjEYV0raW9SgUg1gPH0T5C7LLlFi3ZE1zIWCqow~pZNRhxD2FVfDWoW8qiPU4~L7ypqbVLHP7e5OsFJdMk4dOE-QIU-3yLP-0vNsCVSMF4MF6FtFSnEFUYNv3Bep96dTex6oUwbex2T70twxixFSnC0F9PTq2KX6ChWjXsGO9i6R-jw-l4fRlzYojSNEUFRcfnxikgOwrqkXRazZApQtALILr-KP6VIkNESpEpz~Bcc4qgOm9hgch~9-bohAckUQ37HiTMEyhGHuy5AzRDu2~TsyJvrW3L5EuvK8lgUdDqscle9PtA__';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 195,
                    height: 52,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 30,
                          child: Text(
                            'Hello Jega',
                            style: TextStyles.largeTextBold,
                          ),
                        ),
                        SizedBox(
                          width: 195,
                          height: 17,
                          child: Text(
                            'What are you cooking today?',
                            style: TextStyles.smallerTextRegular.copyWith(
                              color: ColorStyles.gray3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: ColorStyles.secondary40,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        print('탭됨');
                        context.go(Routes.home + Routes.search);
                      },
                      child: AbsorbPointer(child: SearchField(controller: controller))),
                  SizedBox(width: 20),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorStyles.primary80,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/outline_setting.png',
                        width: 20,
                        height: 20,
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
