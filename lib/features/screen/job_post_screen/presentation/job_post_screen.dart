import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/services/location_service/determine_position.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/after_accept_counter_offer/presentation/widgets/custom_job_title.dart';
import 'package:metal_head/features/screen/auth_flow/create_account_screen/presentation/widgets/input_label_text.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';
import '../provider/toggle_provider.dart';

class JobPostScreen extends StatefulWidget {
  const JobPostScreen({super.key});

  @override
  State<JobPostScreen> createState() => _JobPostScreenState();
}

class _JobPostScreenState extends State<JobPostScreen> {
  late TextEditingController titleController;
  late TextEditingController categoryController;
  late TextEditingController startTimeController;
  late TextEditingController endTimeController;
  late TextEditingController priceController;
  late TextEditingController urgentNoteController;
  late TextEditingController locationController;
  late TextEditingController jobDescriptionController;
  late List<TextEditingController> jobRequireTitleControllers;
  late List<TextEditingController> jobRequireDescriptionControllers;
  late List<TextEditingController> notesTitleControllers;
  late List<TextEditingController> notesDescriptionControllers;

  //late TextEditingController paymentTypeController;
  final List<String> paymentType = ['fixed', 'hourly'];
  //late TextEditingController jobTypeController;
  final List<String> jobType = ['normal', 'urgent'];

  @override
  void initState() {
    titleController = TextEditingController();
    categoryController = TextEditingController();
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
    priceController = TextEditingController();
    urgentNoteController = TextEditingController();
    locationController = TextEditingController();
    jobDescriptionController = TextEditingController();
    jobRequireTitleControllers = List.generate(
      4,
      (index) => TextEditingController(),
    );
    jobRequireDescriptionControllers = List.generate(
      4,
      (index) => TextEditingController(),
    );
    notesTitleControllers = List.generate(
      4,
      (index) => TextEditingController(),
    );
    notesDescriptionControllers = List.generate(
      4,
      (index) => TextEditingController(),
    );
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    categoryController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    priceController.dispose();
    locationController.dispose();
    jobDescriptionController.dispose();
    for (var controller in jobRequireTitleControllers) {
      controller.dispose();
    }
    for (var controller in jobRequireDescriptionControllers) {
      controller.dispose();
    }
    for (var controller in notesTitleControllers) {
      controller.dispose();
    }
    for (var controller in notesDescriptionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            SizedBox(height: 16.h),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Post a New Job',
                      style: style.headlineSmall?.copyWith(
                        color: AppColors.headlineTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "Need help? Post a job and get connected with nearby helpers.",
                      style: style.bodyMedium?.copyWith(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    CustomJobTitle(style: style),
                    Divider(height: 1.h, color: AppColors.borderColor),
                    SizedBox(height: 12),

                    InputLabel(labelText: 'Job Title', style: style),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'Enter Job Title',
                        hintStyle: style.bodyMedium?.copyWith(
                          color: AppColors.inputTextColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),

                    InputLabel(labelText: 'Category', style: style),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: categoryController,
                      decoration: InputDecoration(
                        hintText: 'Select category',
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.inputTextColor,
                        ),
                        hintStyle: style.bodyMedium?.copyWith(
                          color: AppColors.inputTextColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),

                    InputLabel(labelText: 'Start Time', style: style),
                    SizedBox(height: 8.h),
                    GestureDetector(
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          startTimeController.text = pickedDate
                              .toLocal()
                              .toString()
                              .split(' ')[0];
                        }
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: startTimeController,
                          decoration: InputDecoration(
                            hintText: 'Select your preferred date',
                            suffixIcon: Icon(
                              Icons.calendar_today_outlined,
                              color: AppColors.inputTextColor,
                            ),
                            hintStyle: style.bodyMedium?.copyWith(
                              color: AppColors.inputTextColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),

                    InputLabel(labelText: 'End Time', style: style),
                    SizedBox(height: 8.h),
                    GestureDetector(
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          endTimeController.text = pickedDate
                              .toLocal()
                              .toString()
                              .split(' ')[0];
                        }
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: endTimeController,
                          decoration: InputDecoration(
                            hintText: 'Select your preferred date',
                            suffixIcon: Icon(
                              Icons.calendar_today_outlined,
                              color: AppColors.inputTextColor,
                            ),
                            hintStyle: style.bodyMedium?.copyWith(
                              color: AppColors.inputTextColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),

                    InputLabel(labelText: 'Price', style: style),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: priceController,
                      decoration: InputDecoration(
                        hintText: 'Enter you price',
                        hintStyle: style.bodyMedium?.copyWith(
                          color: AppColors.inputTextColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),

                    InputLabel(labelText: 'Job Type', style: style),
                    SizedBox(height: 8.h),
                    Consumer(
                      builder: (_, ref, _) {
                        final selectedValue = ref.watch(
                          selectedJobTypeProvider,
                        );
                        return Column(
                          children: [
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                hintText: 'Select a job type',
                                suffixIcon: Icon(Icons.keyboard_arrow_down, color: AppColors.inputTextColor),
                                hintStyle: style.bodyMedium?.copyWith(
                                  color: AppColors.inputTextColor,
                                  fontWeight: FontWeight.w400,
                                )
                              ),
                              dropdownColor: AppColors.redTextColor,
                              initialValue: null,
                              items: jobType.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                ref.read(selectedJobTypeProvider.notifier).state = newValue;
                              },
                            ),
                            if (selectedValue == 'urgent') ...[
                              SizedBox(height: 14.h),
                              InputLabel(
                                labelText: 'Urgent Note',
                                style: style,
                              ),
                              SizedBox(height: 8.h),
                              TextFormField(
                                controller: urgentNoteController,
                                decoration: InputDecoration(
                                  hintText: 'Enter urgent note',
                                  hintStyle: style.bodyMedium?.copyWith(
                                    color: AppColors.inputTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 14.h),

                    InputLabel(labelText: 'Payment Type', style: style),
                    SizedBox(height: 8.h),
                    Consumer(
                      builder: (_, ref, _) {
                        final selectedValue = ref.watch(
                          selectedPaymentTypeProvider,
                        );
                        return DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.keyboard_arrow_down, color: AppColors.inputTextColor),
                              hintText: 'Select a payment type',
                              hintStyle: style.bodyMedium?.copyWith(
                                color: AppColors.inputTextColor,
                                fontWeight: FontWeight.w400,
                              )
                          ),
                          dropdownColor: AppColors.redTextColor,
                          initialValue: null,
                          items: paymentType.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            ref
                                    .read(selectedPaymentTypeProvider.notifier)
                                    .state =
                                newValue;
                          },
                        );
                      },
                    ),
                    SizedBox(height: 14.h),

                    InputLabel(labelText: 'Location', style: style),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: locationController,
                      decoration: InputDecoration(
                        hintText: 'Enter your location',
                        hintStyle: style.bodyMedium?.copyWith(
                          color: AppColors.inputTextColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),

                    GestureDetector(
                      onTap: () async {
                        final locationService = LocationService();
                        final location = await locationService
                            .determinePosition();
                        if (location.isEmpty) {
                          locationController.text = 'Sorry no data found';
                        } else {
                          debugPrint('${location['Area']}, ${location['City']}, ${location['Country']}');
                          locationController.text =
                              '${location['Area']}, ${location['City']}, ${location['Country']}';
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.bgColor4,
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_location_alt_outlined,
                                color: AppColors.headlineTextColor,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Use Current Location',
                                style: style.bodyMedium?.copyWith(
                                  color: AppColors.headlineTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),

                    CustomJobTitle(
                      icon: SvgPicture.asset(
                        AppIcons.descriptionIcon,
                        height: 24,
                        width: 24,
                      ),
                      title: 'Job Description',
                      style: style,
                    ),
                    Divider(height: 1.h, color: AppColors.borderColor),
                    SizedBox(height: 12.h),

                    TextFormField(
                      controller: jobDescriptionController,
                      style: style.bodyMedium?.copyWith(
                        color: AppColors.headlineTextColor,
                      ),
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Enter job description',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),

                    CustomJobTitle(
                      icon: SvgPicture.asset(
                        AppIcons.requirementIcon,
                        height: 24.h,
                        width: 24.w,
                      ),
                      title: 'Job Requirements',
                      style: style,
                    ),
                    SizedBox(height: 14.h),
                    Divider(height: 1.h, color: AppColors.borderColor),
                    SizedBox(height: 12.h),
                    Consumer(
                      builder: (_, ref, _) {
                        final requirementsNumber = ref.watch(
                          jobRequirementsNumberProvider,
                        );
                        return Column(
                          children: List.generate(
                            requirementsNumber,
                            (index) => Column(
                              children: [
                                InputLabel(
                                  labelText: 'Title and description',
                                  style: style,
                                ),
                                SizedBox(height: 12.h),
                                TextFormField(
                                  controller: jobRequireTitleControllers[index],
                                  decoration: InputDecoration(
                                    hintText: 'Enter job title',
                                    hintStyle: style.bodyMedium?.copyWith(
                                      color: AppColors.inputTextColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 12.h),
                                TextFormField(
                                  controller:
                                      jobRequireDescriptionControllers[index],
                                  style: style.bodyMedium?.copyWith(
                                    color: AppColors.headlineTextColor,
                                  ),
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Enter job description',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: BorderSide(
                                        color: AppColors.borderColor,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 14.h),
                    Consumer(
                      builder: (_, ref, _) {
                        return GestureDetector(
                          onTap: () {
                            if (ref.watch(jobRequirementsNumberProvider) < 4) {
                              ref
                                  .read(jobRequirementsNumberProvider.notifier)
                                  .state++;
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.bgColor4,
                              border: Border.all(color: AppColors.borderColor),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(14.r),
                              child: Icon(
                                Icons.add,
                                color: AppColors.headlineTextColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 14.h),
                    CustomJobTitle(
                      icon: SvgPicture.asset(
                        AppIcons.noteIcon,
                        height: 24,
                        width: 24,
                      ),
                      title: 'Important Notes',
                      style: style,
                    ),
                    Divider(height: 1.h, color: AppColors.borderColor),
                    SizedBox(height: 12.h),
                    Consumer(
                      builder: ((_, ref, _) {
                        final notesNumber = ref.watch(notesNumberProvider);
                        return Column(
                          children: List.generate(
                            notesNumber,
                            (index) => Column(
                              children: [
                                InputLabel(
                                  labelText: 'Title and description',
                                  style: style,
                                ),
                                SizedBox(height: 12.h),
                                TextFormField(
                                  controller: notesTitleControllers[index],
                                  decoration: InputDecoration(
                                    hintText: 'Enter Notes title',
                                    hintStyle: style.bodyMedium?.copyWith(
                                      color: AppColors.inputTextColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 12.h),
                                TextFormField(
                                  controller:
                                      notesDescriptionControllers[index],
                                  style: style.bodyMedium?.copyWith(
                                    color: AppColors.headlineTextColor,
                                  ),
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Notes Description',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: BorderSide(
                                        color: AppColors.borderColor,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: 14.h),
                    Consumer(
                      builder: (_, ref, _) {
                        return GestureDetector(
                          onTap: () {
                            if (ref.watch(notesNumberProvider) < 4) {
                              ref.read(notesNumberProvider.notifier).state++;
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.bgColor4,
                              border: Border.all(color: AppColors.borderColor),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(14.r),
                              child: Icon(
                                Icons.add,
                                color: AppColors.headlineTextColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 14.h),
                    InputLabel(
                      labelText: 'Photos',
                      optional: ' (Optional)',
                      color: AppColors.greyTextColor,
                      style: style,
                    ),
                    SizedBox(height: 8.h),
                    DottedBorder(
                      options: RectDottedBorderOptions(
                        dashPattern: [10, 5],
                        strokeWidth: 2,
                        padding: EdgeInsets.all(16),
                        color: AppColors.uploadBorderColor,
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AppIcons.uploadSvg,
                            height: 42.h,
                            width: 42.w,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Drag your file(s) to start uploading',
                            style: style.bodySmall?.copyWith(
                              color: AppColors.headlineTextColor4,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: AppColors.borderColor,
                                  height: 1.h,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(
                                  'or',
                                  style: style.bodySmall?.copyWith(
                                    color: AppColors.headlineTextColor4,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: AppColors.borderColor,
                                  height: 1.h,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 12.h),

                          CustomButton(
                            text: 'Browse Files',
                            width: 110,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 6.h,
                            ),
                            radius: BorderRadius.circular(8.r),
                            containerColor: AppColors.bgTransparent,
                            borderColor: AppColors.uploadBorderColor,
                            textStyle: style.labelMedium?.copyWith(
                              color: AppColors.uploadBorderColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: 'Cancel',
                              borderColor: AppColors.bgColor1,
                              width: 328.w,
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 12.h,
                              ),
                              textStyle: style.bodySmall?.copyWith(
                                color: AppColors.bgColor1,
                                fontWeight: FontWeight.w600,
                              ),
                              containerColor: AppColors.bgTransparent,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Consumer(
                            builder: (_, ref, _) {
                              return Expanded(
                                child: CustomButton(
                                  text: 'Post Job',
                                  width: 328.w,
                                  onPressed: () {
                                    ref.read(selectedJobTypeProvider.notifier).state = null;
                                    ref.read(selectedPaymentTypeProvider.notifier).state = null;
                                    ref
                                            .read(
                                              jobRequirementsNumberProvider
                                                  .notifier,
                                            )
                                            .state =
                                        1;
                                    ref
                                            .read(notesNumberProvider.notifier)
                                            .state =
                                        1;
                                    //onJobPostSuccessfullyTap(context);
                                  },
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24.w,
                                    vertical: 12.h,
                                  ),
                                  textStyle: style.bodySmall?.copyWith(
                                    color: AppColors.whiteTextColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
