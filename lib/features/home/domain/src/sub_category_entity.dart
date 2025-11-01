import 'package:turbo_waiter/features/home/domain/entities/sub_category_entity.dart';

final subCategories = [
  // 🍽️ المقبلات الباردة
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'تبولة عراقية',
    id: '1',
    categoryId: '1',
    name: "تبولة عراقية",
    imagePath: "https://magazine.imn.iq/wp-content/uploads/2022/10/88-26.jpg",
  ),
  const SubCategoryEntity(
    quantity: 30,
    price: 10000,
    description: 'فتوش',
    id: '2',
    categoryId: '1',
    name: "فتوش",
    imagePath:
        "https://i.ytimg.com/vi/RVutUC4AEZk/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLB8k8IUJC9zcpizSghrda7bbSDNyw",
  ),
  const SubCategoryEntity(
    quantity: 22,
    price: 10000,
    description: 'حمص بالطحينة',
    id: '3',
    categoryId: '1',
    name: "حمص بالطحينة",
    imagePath:
        "https://modo3.com/thumbs/fit630x300/233899/1560120734/%D8%B7%D8%B1%D9%8A%D9%82%D8%A9_%D8%B9%D9%85%D9%84_%D8%A7%D9%84%D8%AD%D9%85%D8%B5_%D8%A8%D8%A7%D9%84%D8%B7%D8%AD%D9%8A%D9%86%D8%A9_%D8%A7%D9%84%D8%B9%D8%B1%D8%A7%D9%82%D9%8A%D8%A9.jpg",
  ),
  const SubCategoryEntity(
    quantity: 23,
    price: 10000,
    description: 'لبن بالخيار',
    id: '4',
    categoryId: '1',
    name: "لبن بالخيار",
    imagePath:
        "https://kitchen.sayidaty.net/uploads/small/1e/1eb5a59a095a4cd90ad0bf19ffc619b1_w750_h750.jpg",
  ),
  const SubCategoryEntity(
    quantity: 24,
    price: 10000,
    description: 'ورق عنب',
        id: '5',
    categoryId: '1',
    name: "ورق عنب",
    imagePath:
        "https://img.youm7.com/ArticleImgs/2022/5/18/46188-%D8%B7%D8%B1%D9%8A%D9%82%D8%A9-%D8%B9%D9%85%D9%84-%D9%88%D8%B1%D9%82-%D8%A7%D9%84%D8%B9%D9%86%D8%A8.jpg",
  ),

  // 🍟 المقبلات الساخنة
  const SubCategoryEntity(
    quantity: 25,
    price: 10000,
    description: 'كبة موصلية',
    id: '6',
    categoryId: '2',
    name: "كبة موصلية",
    imagePath:
        "https://img-global.cpcdn.com/recipes/e15bc99e5431e074/240x320cq80/photo.jpg",
  ),
  const SubCategoryEntity(
    quantity: 26,
    price: 10000,
    description: 'سمبوسك لحم',
    id: '7',
    categoryId: '2',
    name: "سمبوسك لحم",
    imagePath: "https://kitchen.sayidaty.net/uploads/node/beef-sambosa.jpg",
  ),
  const SubCategoryEntity(
    quantity: 57,
    price: 10000,
    description: 'بطاطا مقلية',
    id: '8',
    categoryId: '2',
    name: "بطاطا مقلية",
    imagePath:
        "https://modo3.com/thumbs/fit630x300/131999/1479650790/%D8%B7%D8%B1%D9%82_%D9%82%D9%84%D9%8A_%D8%A7%D9%84%D8%A8%D8%B7%D8%A7%D8%B7%D8%B3.jpg",
  ),
  const SubCategoryEntity(
    quantity: 28,
    price: 10000,
    description: 'شوربة عدس',
    id: '9',
    categoryId: '2',
    name: "شوربة عدس",
    imagePath:
        "https://kitchen.sayidaty.net/uploads/small/91/91c86dbe0ff29a5a727ba4b8a8f932a1_w750_h500.jpg",
  ),

  // 🍖 المشاوي العراقية
  const SubCategoryEntity(
    quantity: 25,
    price: 10000,
    description: 'كباب عراقي',
    id: '10',
    categoryId: '3',
    name: "كباب عراقي",
    imagePath:
        "https://kitchen.sayidaty.net/uploads/small/3a/3acd154e7887e1813e6e1b7007982879_w750_h750.jpg",
  ),
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'تكة دجاج',
    id: '11',
    categoryId: '3',
    name: "تكة دجاج",
    imagePath:
        "https://www.atyabtabkha.com/uploads/sites/2/2021/10/097dfa5c52cf7a0b64e9a4b17d39bc14c27ce733.jpg",
  ),
  const SubCategoryEntity(
    quantity: 30,
    price: 10000,
    description: 'تكة لحم',
    id: '12',
    categoryId: '3',
    name: "تكة لحم",
    imagePath: "https://i.ytimg.com/vi/QdWa5oNExLA/maxresdefault.jpg",
  ),
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'سمك مسكوف',
    id: '13',
    categoryId: '3',
    name: "سمك مسكوف",
    imagePath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgdUEEpdFUKSBy-TfIw-Cl-RDFwynTJrZ4-w&s",
  ),

  // 🍚 أكلات رز
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'برياني دجاج',

    id: '14',
    categoryId: '4',
    name: "برياني دجاج",
    imagePath:
        "https://kitchen.sayidaty.net/uploads/small/64/64dfa009433a1cc3ce01980c4982b936_w750_h500.jpg",
  ),
  const SubCategoryEntity(
    quantity: 40,
    price: 10000,
    description: 'برياني لحم',
    id: '15',
    categoryId: '4',
    name: "برياني لحم",
    imagePath:
        "https://i.ytimg.com/vi/k70YeQBRjd0/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBEo36gdaZfJ93mwYnqhxlyKf1ZXg",
  ),
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'تمن مع مرق البامية',
    id: '16',
    categoryId: '4',
    name: "تمن مع مرق البامية",
    imagePath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdYicT_M2oH-9z6MUxnAl7hdwLQ5OTfwVJhA&s",
  ),

  // 🍲 أكلات تقليدية
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'دولمة عراقية',
    id: '17',
    categoryId: '6',
    name: "دولمة عراقية",
    imagePath: "https://i.ytimg.com/vi/enaf72QXpXE/maxresdefault.jpg",
  ),
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'تشريب لحم',
    id: '18',
    categoryId: '6',
    name: "تشريب لحم",
    imagePath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRsbvd4LMVauoEOpR8ZgQ7dOx0sR83hWFg1g&s",
  ),
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'قوزي عراقي',
    id: '19',
    categoryId: '6',
    name: "قوزي عراقي",
    imagePath:
        "https://i0.wp.com/albukhari.com/wp-content/uploads/2023/07/maxresdefault.jpg?resize=1280%2C720&ssl=1",
  ),

  // 🥙 الساندويشات والمعجنات
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'ساندويش كباب',
    id: '20',
    categoryId: '7',
    name: "ساندويش كباب",
    imagePath:
        "https://kitchen.sayidaty.net/uploads/small/c1/c12af5a89f3fef484139dc393018d16f_w750_h500.jpg",
  ),
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'ساندويش تكة دجاج',
    id: '21',
    categoryId: '7',
    name: "ساندويش تكة دجاج",
    imagePath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8RZrfxACvLnZN5r2nxKs1fzppPy9Jr0V3Hg&s",
  ),
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'شاورما دجاج',
    id: '22',
    categoryId: '7',
    name: "شاورما دجاج",
    imagePath:
        "https://i.ytimg.com/vi/1G7hD6iYVxQ/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCNYEFRridXTNt9fKYGZm5s1j5epg",
  ),

  // 🍮 الحلويات العراقية
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'كنافة عراقية',
    id: '23',
    categoryId: '8',
    name: "كنافة عراقية",
    imagePath:
        "https://watanimg.elwatannews.com/image_archive/original_lower_quality/7940924651710343499.jpg",
  ),
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'بقلاوة',
    id: '24',
    categoryId: '8',
    name: "بقلاوة",
    imagePath:
        "https://kitchen.sayidaty.net/uploads/small/ad/ad7f457749153096a800237811dd9f50_w750_h500.jpg",
  ),
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'زلابية',
    id: '25',
    categoryId: '8',
    name: "زلابية",
    imagePath:
        "https://img-global.cpcdn.com/recipes/208311/680x781cq80/%D8%A7%D9%84%D8%B5%D9%88%D8%B1%D8%A9-%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9-%D9%84%D9%88%D8%B5%D9%81%D8%A9%D8%B7%D8%B1%D9%8A%D9%82%D8%A9-%D8%B9%D9%85%D9%84-%D8%B2%D9%84%D8%A7%D8%A8%D9%8A%D8%A9.jpg",
  ),

  // 🧃 المشروبات الباردة
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'عصير رمان',
    id: '26',
    categoryId: '10',
    name: "عصير رمان",
    imagePath:
        "https://static.webteb.net/images/content/tbl_articles_article_18781_29cf234465-bced-48eb-be88-c5330b506b3f.jpg",
  ),
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'عصير ليمون بالنعناع',
      id: '27',
    categoryId: '10',
    name: "عصير ليمون بالنعناع",
    imagePath:
        "https://kms.sohati.com/Images/998x749xo/190522110930237~%D8%B9%D8%B5%D9%8A%D8%B1-%D8%A7%D9%84%D9%84%D9%8A%D9%85%D9%88%D9%86-%D8%A8%D8%A7%D9%84%D9%86%D8%B9%D9%86%D8%A7%D8%B9.jpg",
  ),
  const SubCategoryEntity(
    quantity: 20,
    price: 10000,
    description: 'بيبسي / سفن أب',
    id: '28',
    categoryId: '10',
    name: "بيبسي / سفن أب",
    imagePath:
        "https://www.qebox.app/qebox/wp-content/uploads/2025/07/%D8%B3%D9%81%D9%86-%D8%A7%D8%A8-%D9%85%D9%88%D9%87%D9%8A%D8%AA%D9%88-01.png",
  ),
];
