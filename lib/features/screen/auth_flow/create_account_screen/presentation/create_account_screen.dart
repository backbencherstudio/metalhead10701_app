import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/data/provider/store_cache.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import '../../../../../core/repository/auth/auth_repository_implemented.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../../core/services/shared_preference/shared_preference.dart';
import '../../login_screen/presentation/widgets/input_label_text.dart';
import '../../splash/presentation/widgets/custom_button.dart';


enum SingingCharacter { user, helper }

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late TextEditingController _passController;
  late TextEditingController _typeController;
  late TextEditingController _userNameController;

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _typeController = TextEditingController();
    _userNameController = TextEditingController();

    _typeController.text = SingingCharacter.user.name.toString();
    super.initState();
  }

  @override
  dispose(){
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _typeController.dispose();
  }
  SingingCharacter? _character = SingingCharacter.user;
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              SizedBox(height: 8.h),
              Text(
                "Let's Create Account!",
                style: style.headlineMedium?.copyWith(
                  color: AppColors.headlineTextColor2,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Enter your detail below to create new account',
                style: style.bodySmall?.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),
              SizedBox(height: 20.h),

              InputLabel(labelText: 'First Name', optional: ' *', style: style),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _firstNameController,
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(hintText: 'Enter your first name'),
              ),

              SizedBox(height: 12.h),
              InputLabel(
                labelText: 'Last Name',
                optional: ' (Optional)',
                color: AppColors.greyTextColor,
                style: style,
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _lastNameController,
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(hintText: 'Enter your last name'),
              ),

              SizedBox(height: 12.h),
              InputLabel(labelText: 'Email', optional: ' *', style: style),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _emailController,
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(hintText: 'Enter your last email'),
              ),

              SizedBox(height: 12.h),
              InputLabel(
                labelText: 'Phone Number',
                optional: ' *',
                style: style,
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _phoneNumberController,
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(
                  hintText: '0000000000',
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.r,
                          top: 16.h,
                          bottom: 16.h,
                        ),
                        child: SvgPicture.asset(
                          AppIcons.useSvg,
                          width: 24.w,
                          height: 18.h,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '+1',
                        style: style.bodyMedium?.copyWith(
                          color: AppColors.headlineTextColor,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.headlineTextColor,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '|',
                        style: style.bodyMedium?.copyWith(
                          color: AppColors.lightGreyTextColor,
                        ),
                      ),
                      SizedBox(width: 8.w),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 12.h),
              InputLabel(labelText: 'User Name', optional: ' *', style: style),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _userNameController,
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(hintText: 'Enter your user name'),
              ),

              SizedBox(height: 12.h),
              InputLabel(labelText: 'Password', optional: ' *', style: style),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _passController,
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColors.lightGreyTextColor,
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              InputLabel(labelText: 'Select Your Role', style: style),
              SizedBox(height: 8.h),
              RadioGroup<SingingCharacter>(
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                    _typeController.text = value!.name.toString();
                    debugPrint(value.name.toString());
                  });
                },
                child: Row(
                 // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 170.w,
                      decoration: BoxDecoration(
                        color: AppColors.bgColor4,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: ListTile(
                        horizontalTitleGap: 0,
                        title: Text(
                          'Job Poster',
                          style: style.bodyMedium?.copyWith(
                            color: AppColors.greyTextColor,
                          ),
                        ),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.user,
                          fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                            if (states.contains(WidgetState.selected)) {
                              return AppColors.bgColor6;
                            }
                            return AppColors.bgColor6;
                          }),
                        ),
                      ),
                    ),

                    Container(
                      width: 170.w,
                      decoration: BoxDecoration(
                        color: AppColors.bgColor4,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: ListTile(
                        horizontalTitleGap: 0,
                        title: Text(
                          'Helper',
                          style: style.bodyMedium?.copyWith(
                            color: AppColors.greyTextColor,
                          ),
                        ),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.helper,
                          fillColor: WidgetStateProperty.resolveWith<Color>((
                            Set<WidgetState> states,
                          ) {
                            if (states.contains(WidgetState.selected)) {
                              return AppColors.bgColor6;
                            }
                            return AppColors.bgColor6;
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.bgColor5.withAlpha(40),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No role selected — you are signing up as a Job Poster by default. You can switch your role anytime in your account settings.',
                        style: style.labelMedium?.copyWith(
                          color: AppColors.bgColor5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20.h),

              Center(child: Consumer(
                builder: (_, ref, _) {
                  return CustomButton(
                    text: 'Sign Up',
                    textColor: AppColors.onPrimary,
                    onPressed: () async {
                      final isRegisterSuccess = await AuthRepoImplemented().registerService(
                          _firstNameController.text + _lastNameController.text,
                          _userNameController.text,
                          _firstNameController.text,
                          _lastNameController.text,
                          _phoneNumberController.text,
                          _typeController.text,
                          _emailController.text,
                          _passController.text
                      );

                      if(isRegisterSuccess) {
                        ref.read(getEmailProvider.notifier).state = _emailController.text;
                        await SharedPreference().setEmailId(_emailController.text);
                        debugPrint("\n\n\n\n${await SharedPreference().getEmailId()}\n\n\n\n");
                        context.go(RouteName.verificationScreen);
                      }
                      else {
                        debugPrint("\n\n\n\n$isRegisterSuccess\n\n\n\n");
                        Fluttertoast.showToast(msg: "Something went wrong");
                      }
                    },
                    isBig: true,
                  );
                }
              )
              ),
              SizedBox(height: 20.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have an account?',style: style.bodySmall?.copyWith(
                    color: AppColors.headlineTextColor,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox(width: 4.w),
                  TextButton(
                    child: Text('Log In',
                      style: style.labelMedium?.copyWith(
                          color: AppColors.bgColor6,
                          fontWeight: FontWeight.w600
                      ),),
                    onPressed: () async {
                      context.go(RouteName.loginScreen);
                    },
                  ),
                ]
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
