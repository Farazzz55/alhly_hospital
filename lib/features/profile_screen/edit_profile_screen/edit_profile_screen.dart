import 'dart:io';
import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/core/widget/button.dart';
import 'package:alhly_hospital/features/profile_screen/edit_profile_screen/input_edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfileScreen extends StatefulWidget {
  static String routeName = 'profile_screen';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ImagePicker picker = ImagePicker();
  File? imageFile;

  /// Function to pick an image and allow cropping
  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile == null) return;

      File? croppedFile = await cropImage(File(pickedFile.path));
      if (croppedFile != null && mounted) {
        setState(() {
          imageFile = croppedFile;
        });
      }
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  /// Crop the selected image
  Future<File?> cropImage(File image) async {
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        aspectRatioPresets: [CropAspectRatioPreset.square],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: AppColors.greenColor,
            toolbarWidgetColor: Colors.white,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'Crop Image',
            aspectRatioLockEnabled: true,
          ),
        ],
      );

      if (croppedFile != null) {
        return File(croppedFile.path);
      }
      return null;
    } catch (e) {
      debugPrint('Failed to crop image: $e');
      return null;
    }
  }

  /// Show image picker options
  void showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(15.w),
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt, color: AppColors.greenColor),
                title: Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: AppColors.greenColor),
                title: Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final args= ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String name=args['name']??'Null';
    String email=args['email']??'Null';
    String mobileNumber=args['mobileNumber']??'Null';

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200.h,
                  child: Image.asset(
                    'assets/images/doctor-with-stethoscope-hands-hospital-background 1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.h,
                  left: 20.w,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, size: 35.w),
                  ),
                ),
                Positioned(
                  top: 104.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60.w,
                          backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
                          child: imageFile == null
                              ? Icon(Icons.person, color: AppColors.greenColor, size: 50.w)
                              : null,
                        ),
                        Positioned(
                          bottom: 5.w,
                          right: 5.w,
                          child: GestureDetector(
                            onTap: showImagePickerOptions,
                            child: CircleAvatar(
                              backgroundColor: AppColors.greenColor,
                              radius: 18.w,
                              child: Icon(Icons.add, color: Colors.white, size: 18.w),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputEditProfile(label: 'Name', content: name),
                  SizedBox(height: 20.h,),
                  InputEditProfile(label: 'Email', content: email),
                  SizedBox(height: 20.h,),
                  Text('Mobile Number',  style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),),
                  SizedBox(height: 10.h,),
                  IntlPhoneField(
                    controller: TextEditingController(text: mobileNumber),
                    flagsButtonPadding: const EdgeInsets.all(8),
                    dropdownIconPosition: IconPosition.trailing,
                    decoration:  InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(
                          color: AppColors.greenColor,
                          width: 2.w,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(
                          color: AppColors.greenColor,
                          width: 2.w,
                        ),
                      ),
                    ),
                    initialCountryCode: 'EG',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  SizedBox(height: 50.h,),
                  Center(child: ButtonWidget(buttonColor: AppColors.greenColor, buttonText: 'Save Changes', textColor: Colors.white, onTap: (){}))
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
