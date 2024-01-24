import 'package:flutter_application_6/data/models/info_widget.dart';
import 'package:flutter_application_6/presentation/screens/welcome_screen.dart';
import 'package:flutter_application_6/presentation/widgets/resources/resources.dart';

abstract class AppData {

  static  List<InfoWidgetModel> data = [
     InfoWidgetModel(
        image: AppPngs.hospital, 
        title: "Записывайтесь на прием к самым лучшим специалистам",
        ),
        InfoWidgetModel(
        image: AppPngs.clip, 
        title: "Сохраняйте результаты ваших анализов, диагнозы и рекомендации от врачей в собственную библиотеку",
        ),
        InfoWidgetModel(
        image: AppPngs.speech, 
        title: "Просматривайте отзывы о врачах и дополняйте собственными комментариями",
        ),
        InfoWidgetModel(
        image: AppPngs.bell, 
        title: "Получайте уведомления о приеме или о поступивших сообщениях",
        ),
  ];
  
}