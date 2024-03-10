import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/core/app_consts.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/resources/resources.dart';
import 'package:flutter_application_6/presentation/widgets/settings_button.dart';
import 'package:flutter_application_6/presentation/widgets/shared_prefs_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? imagePath;
  File? pickedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SettingsButton(
            onPressed: () {},
          ),
        ],
        centerTitle: false,
        title: Text(
          'Мой профиль',
          style: AppFonts.w700s34.copyWith(
            color: AppColors.black,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: imagePath != null ? FileImage(File(
                      imagePath!
                    ),)
                    : null,
                  radius: 50,
                  backgroundColor: AppColors.lightblue,
                  child: imagePath != null
                  ? null:
                   Text(
                  '${SharedPrefsWidget.prefs.getString(AppConsts.name)?[0] ?? ''}${SharedPrefsWidget.prefs.getString(AppConsts.sureName)?[0] ?? ''}',     
                  style: AppFonts.w700s34.copyWith(
                    color: AppColors.white,
                  ),
                           ),
                    ),

                   Positioned(
                    bottom: 0,
                    right: 0,

                     child: CircleAvatar(
                      radius: 16.r,
                      backgroundColor: AppColors.buttoncolor,
                      child:  Center(
                        child: InkWell(
                          onTap: () {
                            openDialog();
                          },
                          child: Icon(Icons.camera_alt_sharp,
                          color: Colors.white,
                          ),
                        ),
                      ),
                      ),
                      
                     ),
                   
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text('${SharedPrefsWidget.prefs.getString(AppConsts.name)} ${SharedPrefsWidget.prefs.getString(AppConsts.sureName)}',
              style: AppFonts.w500s22,
              ),
              const SizedBox(
                height: 10,
              ),
              Text('+996${SharedPrefsWidget.prefs.getString(AppConsts.pnoneNumber)}',
              style: AppFonts.w500s22,
              ),
              SizedBox(
              height: MediaQuery.of(context).size.height * 0.49,
              
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: AppColors.buttoncolor,
                          unselectedLabelStyle: AppFonts.w500s15,
                          labelStyle: AppFonts.w500s15,
                  tabs: [
                   Tab(
                              icon: Image.asset(AppPngs.analys),
                              text: 'Анализы',
                            ),
                            Tab(
                              icon: Image.asset(AppPngs.diagnoses),
                              text: 'Диагнозы',
                            ),
                            Tab(
                              icon: Image.asset(AppPngs.recomends),
                              text: 'Рекомендации',
                            ),
                          ],
                  ),

                  Expanded(
                    child: TabBarView(
                      children:[
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 32,
                              ),
                              Image.asset(AppPngs.clip,
                              height: 105.h,
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              Text('У вас пока нет добавленных результатов  \nанализов',
                              style: AppFonts.w500s15.copyWith(
                                color: AppColors.fontscolor,
                              ),
                              textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 33,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AppPngs.add),
                                  TextButton(onPressed: openFile, 
                                  child: Text('Добавить документ',
                                  style: AppFonts.w500s15,
                                  ),),
                                ],
                                ),
                             
                            ],
                          ),
                        ),
                        Center(
                          child: Text('Diagnoses'),
                        ),
                        Center(
                          child: Text('recomends'),
                        )
                      ] ,
                    ),
                  ),
                  ],
                ),
                
                ),
              
              ),
            ],
          ),
        ),
      ),
    );
    
  }

Future <void> openFile() async{
  FilePickerResult? result = await FilePicker.platform.pickFiles();

if (result != null) {
 pickedFile = File(result.files.single.path!);
} else {
  // User canceled the picker
}

}

  void openDialog(){
    showDialog(context: context, 
    builder: (context)=> AlertDialog(
      content: SizedBox(
        height: 400,
        child: Column(
          children: [
            TextButton(onPressed: (){
              pickProfileImage(source: ImageSource.gallery);
              Navigator.pop(context);
            }, 
            child: Text('Gallery', style: AppFonts.w700s34,),),
            TextButton(onPressed: (){
              pickProfileImage(source: ImageSource.camera);
              Navigator.pop(context);
            }, 
            child: Text('Camera' , style: AppFonts.w700s34),),
          ],
        ),
      ),
    )
    );
  }

   Future <void> pickProfileImage({required ImageSource source}) async{
    final ImagePicker imagePicker = ImagePicker();

    try{XFile? file = await 
    imagePicker.pickImage(
      source: source);
      if(file != null){
        imagePath = file.path;
        setState(() {});
      }
      }
    catch(e){
      print(e.toString());
    }
   }
}