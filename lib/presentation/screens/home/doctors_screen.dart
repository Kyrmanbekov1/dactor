import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/data/models/doctors_model.dart';
import 'package:flutter_application_6/presentation/screens/home/doctors_info.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/doctors_info_widget.dart';
import 'package:flutter_application_6/presentation/widgets/my_chip.dart';
import 'package:flutter_application_6/presentation/widgets/resources/resources.dart';
import 'package:flutter_application_6/presentation/widgets/search_teext_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final TextEditingController controller = TextEditingController();
int selectIndex = 0;

  List <String>  specials = ['Артимологи', 'Кардиологи', 'Кардиохирурги',];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('Доктора',
                  style: AppFonts.w700s34,
                  ),
                  const Spacer(),
                  Image.asset(AppPngs.bell1)
                  
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SearchTextField(
                    controller: controller,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller.clear();
                    },
                    child: Text('Очистить',
                    style: AppFonts.w600s14,
                    ),
                  ),
                  
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: ListView.builder(
                  itemBuilder: (context, index) => MyChip(
                    onSelected: (val){
                      selectIndex = index;
                      setState(() {

                      });
                    },
                    isSelected: selectIndex == index,
                   title: specials[index],),
                  itemCount: specials.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.57,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.black,
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) => DoctorsInfoWidget(
                    model: DoctorsData.doctors[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorsInfo(
                            model: DoctorsData.doctors[index],
                          ),
                        ),
                      );
                    },
                  ),
                  itemCount: DoctorsData.doctors.length,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}

