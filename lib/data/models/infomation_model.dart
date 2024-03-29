class InfoModel {
  final String text;
  final List<ArticleModel> article;
  final String data;

  InfoModel(
      {required this.data,
        required this.text,
      required this.article});
}

class ArticleModel {
  final String image;
  final String name;
  final String text;
  final String date;

  ArticleModel(
      {required this.image,
      required this.name,
      required this.text,
      required this.date});
}
abstract class InfoData {
  static List<InfoModel> info = [
    InfoModel(
      text: 'Приводит ли использование наушников к потере слуха?',
      data: '12 июня 2020',
      article: [
        ArticleModel(image: 'https://img5.lalafo.com/i/posters/original/75/e2/10/5979a8f65216f17acb4df5d52c.jpeg', 
        name: 'Эрика Исаева',
         text: 'Всемирная организация здравоохранения предупреждает — миллионы молодых людей слушают музыку слишком громко. Неужели мы все портим слух, проводя так много времени с наушниками?Житель большого города проводит около 75% времени в компании внутриканальных наушников. Мы слушаем подкасты в метро, затем ставим в очередь плейлист в Spotify, чтобы не отвлекаться от своих задач в открытом офисном пространстве. После работы тренируемся под электронную музыку и перегруженную басами попсу, а по пути домой знакомимся с новостями на радио. В конце дня заходим в сервис стримингового видео и, чтобы не нарушать спокойствия соседа, надеваем наушники, погружаясь в ноутбук. И уже после, положив влажные наушники на тумбочку, задаемся вопросом: портим ли вы свой слух, проводя большую часть дня в наушниках? Какие типы звуков приводят к потере слуха? В 2015 году Всемирная организация здравоохранения выпустила вторящее материнской заботе заявление, предупреждающее, что 1,1 миллиона молодых людей рискуют потерять слух из-за частого прослушивания громкой музыки через свои устройства и на концертах. ВОЗ проанализировала данные исследований «стран со средним и высоким уровнем дохода» и обнаружила, что почти 50% жителей в возрасте от 12 до 35 лет попадали под влияние небезопасных уровней шума своих смартфонов и плееров, а 40% получали потенциально опасное воздействие в барах, ночных клубах, спортивных стадионах и концертах. Когда же просто «громко» становится слишком громким? ВОЗ признала уровень шума больше 85 децибел на протяжении 8 часов опасным, и ограничила безопасное время прослушивания звуков громкостью 100 децибел 15 минутами.ваших наушниках зачастую ничуть не тише шума города? Слышите звон в ушах или у вас есть периоды, когда ваши уши болят, а вы плохо слышите? Если так, сделайте потише или отдохните от альбомов группы Slayer.', 
         date: '12 июня 2020')
      ]
    ),
    ];
    }