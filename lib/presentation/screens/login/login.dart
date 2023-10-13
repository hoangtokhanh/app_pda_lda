import 'package:app_pda_lda/app/config/app_color.dart';
import 'package:app_pda_lda/app/config/app_dimen.dart';
import 'package:app_pda_lda/app/config/app_text_styles.dart';
import 'package:app_pda_lda/app/extensions/responsive_dimens.dart';
import 'package:app_pda_lda/app/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/config/app_config.dart';
import '../../../app/widgets/common_text.dart';
import '../../../app/widgets/loading_item.dart';
import '../../../app/widgets/my_input_field.dart';
import '../../controller/app_controller.dart';
import '../../controller/login_controller.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  RxBool isLoading = false.obs;
  RxString item = ''.obs;
  Map mapBranch = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double widthResponsive = (MediaQuery.of(context).size.width * 0.25 < 350)
        ? 400
        : ((MediaQuery.of(context).size.width * 0.25 > 400) ? 450 : (MediaQuery.of(context).size.width * 0.25));
    return Scaffold(
      body: Obx(
            () => !isLoading.value
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'VẬN HÀNH KHO',
                style: AppTextStyles.header
                    .copyWith(color: AppColors.darkBluePrimary),
              ),
              Text(
                'Đăng nhập',
                style: AppTextStyles.header
                    .copyWith(fontSize: 22.0.responsive(), color: AppColors.darkBluePrimary),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.only(right: 28, left: 28,top: 5,bottom: 5),
                child: MyInputField(
                  label: 'Tài khoản',
                  input: Get.find<LoginController>().username,
                  width: widthResponsive,
                  onSubmitted: (e) {
                    appController.loginController.login(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 28, left: 28,top: 5,bottom: 5),
                child: MyInputField(
                  label: 'Mật khẩu',
                  isPassword: true,
                  onSubmitted: (e) {
                    appController.loginController.login(context);
                  },
                  input: Get.find<LoginController>().password,
                  width: widthResponsive,
                ),
              ),
              const SizedBox(height: 12),
              Obx(() => CommonButton(
                isCompleted: appController.loginController.isComplete.value,
                isLoading: appController.loginController.isLoading.value,
                validate: true,
                width: widthResponsive,
                color: AppColors.darkBluePrimary,
                margin: const EdgeInsets.only(right: 28, left: 28, top: 10, bottom: 10),
                borderRadius: 5,
                height: 55,
                callback: (){
                  appController.loginController.login(context);
                },
                childWidget: CommonText(
                  text: 'Đăng nhập',
                  style: AppTextStyles.defaultStyle,
                  color: AppColors.white,
                ),
              )),
            ],
          ),
        )
            : const LoadingItem(size: 200), // list Branch empty
      ),
      bottomNavigationBar: Container(
        height: 30,
        padding: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.bottomCenter,
        child:
        Text(AppConfig.version, style: AppTextStyles.small,),
      ),
    );
  }
}
