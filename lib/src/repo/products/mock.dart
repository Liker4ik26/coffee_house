import 'package:coffee_house/src/repo/products/model.dart';
import 'package:coffee_house/src/repo/products/repository.dart';
import 'package:coffee_house/src/shared/api/types.dart';
import 'package:uuid/uuid.dart';

class ProductsRepositoryMock implements ProductsRepository{
  final List<ProductsSectionModel> _products = [
    ProductsSectionModel(
      category: 'Черный кофе',
      productsList: [
        ProductModel(
          id: const Uuid().v4(),
          image: 'https://dvazajci.com/wp-content/uploads/2021/05/photo.jpg',
          name: 'Американо',
          cost: 129,
        ),
        ProductModel(
          id: const Uuid().v4(),
          image:
          'https://chicagohealthonline.com/wp-content/uploads/2015/07/Dollarphotoclub_67257819-scaled.jpg',
          name: 'Русский американо',
          cost: 229,
        ),
        ProductModel(
          id: const Uuid().v4(),
          image: 'porcelain-1626627.jpg',
          name: 'Эспрессо',
          cost: 259,
        ),
      ],
    ),
    ProductsSectionModel(
      category: 'Кофе с молоком',
      productsList: [
        ProductModel(
          id: const Uuid().v4(),
          image: 'https://jooinn.com/images/cup-of-coffee-39.jpg',
          name: 'Классический',
          cost: 209,
        ),
        ProductModel(
          id: const Uuid().v4(),
          image:
          'https://sun9-38.userapi.com/impg/Lj6SEU6P7QozwNakDruMiFkT0lveRH-3pFqTzQ/jdVGCYV3mx0.jpg?size=1280x854&quality=95&sign=35b9e662e18e4c0f6bb04e538ba3eeb9&c_uniq_tag=Y2tK7zoS0c0UIzc1lMo8opLrvilRsNuFOD9lk7rJBb4&type=album',
          name: 'Фирменный ачино',
          cost: 109,
        ),
        ProductModel(
          id: const Uuid().v4(),
          image:
          'https://omtea.ru/wp-content/uploads/8/d/9/8d96d5aecac14d993572594e64623b83.jpeg',
          name: 'Бреве',
          cost: 259,
        ),
      ],
    ),
    ProductsSectionModel(
      category: 'Чай',
      productsList: [
        ProductModel(
          id: const Uuid().v4(),
          image: 'https://motea.ru/images/catalog/originals/0001425.jpeg',
          name: 'Белый чай',
          cost: 159,
        ),
        ProductModel(
          id: const Uuid().v4(),
          image:
          'https://i.pinimg.com/originals/a9/67/3d/a9673d71e16592cd2bba0690a6ae6b01.jpg',
          name: 'Зелёный чай',
          cost: 109,
        ),
        ProductModel(
          id: const Uuid().v4(),
          image:
          'https://podacha-blud.com/uploads/posts/2022-12/1670212742_17-podacha-blud-com-p-chai-chernii-foto-v-kruzhke-18.jpg',
          name: 'Черный чай',
          cost: 99,
        ),
      ],
    ),
    ProductsSectionModel(
      category: 'Авторские напитки',
      productsList: [
        ProductModel(
          id: const Uuid().v4(),
          image:
          'https://about-tea.ru/wp-content/uploads/d/9/f/d9f946f4faa2dbe4eb574abdaf2489e0.jpeg',
          name: 'Наслаждение',
          cost: 259,
        ),
        ProductModel(
          id: const Uuid().v4(),
          image:
          'https://www.restoran.ru/upload/iblock/cb5/thai-kofe-holodniy_sixty-_1_.jpg',
          name: 'Фантастика',
          cost: 239,
        ),
        ProductModel(
          id: const Uuid().v4(),
          image:
          'https://www.timeout.ru/img/Ekaterina%20Solovey/%D0%9E%D1%81%D0%B5%D0%BD%D0%BD%D0%B5-%D0%B7%D0%B8%D0%BC%D0%BD%D0%B5%D0%B5%20%D0%BC%D0%B5%D0%BD%D1%8E%20%D1%8E%D0%B2%20%D0%94%D0%B0%D0%B1%D0%BB%D0%B1%D0%B8/_DSC7541.jpg',
          name: 'Слёзы богов',
          cost: 199,
        ),
      ],
    ),
  ];
  @override
  FutureE<List<ProductsSectionModel>> getProducts() => safeMock(_products);

}