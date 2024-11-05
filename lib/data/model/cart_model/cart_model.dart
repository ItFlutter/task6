import 'peoduct.dart';
import 'user.dart';

class CartModel {
  int? id;
  Peoduct? peoduct;
  User? user;
  int? quantity;

  CartModel({this.id, this.peoduct, this.user, this.quantity});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'] as int?,
        peoduct: json['peoduct'] == null
            ? null
            : Peoduct.fromJson(json['peoduct'] as Map<String, dynamic>),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        quantity: json['quantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'peoduct': peoduct?.toJson(),
        'user': user?.toJson(),
        'quantity': quantity,
      };
}
