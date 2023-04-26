import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/constants/constants.dart';
import 'package:grow_food/core/constants/svg_and_img.dart';
import 'package:grow_food/core/helpers/widgets/custom_button.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/core/helpers/widgets/my_behavior.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {});
    // Future.delayed(const Duration(milliseconds: 600)).then(
    //   (value) => scrollController.animateTo(
    //     scrollController.position.maxScrollExtent,
    //     duration: const Duration(milliseconds: 400),
    //     curve: Curves.easeInOut,
    //   ),
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            padding: EdgeInsets.zero,
            controller: scrollController,
            children: [
              Image.asset(
                Img.like,
                width: 381,
                height: 360,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                child: const CustomText(
                  title: 'ИНСТРУКЦИЯ КАК ПОПАСТЬ В ТГ ЧАТ ПОДДЕРЖКУ',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  centerTitle: true,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                child: const CustomText(
                  title:
                      'Есть вопросы, хотите записаться на занятия или получить купон? Свяжитесь с поддержкой приложения!',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  centerTitle: true,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                child: const CustomText(
                  title:
                      '1. Нажмите кнопку "Перейти в чат"\n2. После Вас перенаправят в Telegram бот\n3. Нажмите кнопку "Начать\n4. Далее нажмите внизу белую кнопку "Отправить номер телефона"\n5. Задайте интересующий вопрос в бот и дождитесь ответа поддержки',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  centerTitle: true,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: const CustomText(
                  title: 'Наши менеджеры ответят Вам в течение\n12 часов❤️',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  centerTitle: true,
                ),
              ),
              CustomButton(
                title: 'Перейти в Telegram',
                accentText: true,
                onTap: () async => {
                  if (!await launchUrl(
                    Uri.parse(telegramBot),
                    mode: LaunchMode.externalApplication,
                  ))
                    {
                      throw 'Could not launch $telegramBot',
                    }
                },
              ),
              SizedBox(
                height: 35.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
