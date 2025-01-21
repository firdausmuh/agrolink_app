// class ShippingMethod {
//   final String agent;
//   final String serviceType;
//   final String estimatedTime;
//   final String cost;
//
//   ShippingMethod({
//     required this.agent,
//     required this.serviceType,
//     required this.estimatedTime,
//     required this.cost,
//   });
// }
//
// List<ShippingMethod> shippingMethods = [
//   ShippingMethod(
//     agent: 'Ninja Express',
//     serviceType: 'Standard',
//     estimatedTime: '1 - 2 Hari',
//     cost: 'Rp. 9.000',
//   ),
//   ShippingMethod(
//     agent: 'J&T',
//     serviceType: 'Express',
//     estimatedTime: '3 - 6 Hari',
//     cost: 'Rp. 8.000',
//   ),
//   ShippingMethod(
//     agent: 'JNE',
//     serviceType: 'CTC',
//     estimatedTime: '1 - 2 Hari',
//     cost: 'Rp. 10.000',
//   ),
// ];

class ShippingMethod {
  final String agent;
  final String serviceType;
  final String estimatedTime;
  final String cost;

  ShippingMethod({
    required this.agent,
    required this.serviceType,
    required this.estimatedTime,
    required this.cost,
  });
}

List<ShippingMethod> shippingMethods = [
  ShippingMethod(
    agent: 'Ninja Express',
    serviceType: 'Standard',
    estimatedTime: '1 - 2 Hari',
    cost: 'Rp. 9.000',
  ),
  ShippingMethod(
    agent: 'J&T',
    serviceType: 'Express',
    estimatedTime: '3 - 6 Hari',
    cost: 'Rp. 8.000',
  ),
  ShippingMethod(
    agent: 'JNE',
    serviceType: 'CTC',
    estimatedTime: '1 - 2 Hari',
    cost: 'Rp. 10.000',
  ),
];