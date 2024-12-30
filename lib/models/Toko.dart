import 'dart:ffi';

class Toko {
  final String title;
  final String description;
  final int harga;
  final int stok;
  final String gambar;

  Toko({
    required this.title,
    required this.description,
    required this.harga,
    required this.stok,
    required this.gambar,
  });
}

List<Toko> tokos = [
  Toko(
    title: 'Sayur Bayam',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aut odio, nostrum, molestias fuga magni unde enim iusto deleniti expedita quidem inventore itaque ut aliquam eaque, recusandae provident eius. Incidunt, quis adipisci eius similique omnis quidem voluptates impedit quaerat sed provident quod iure laudantium soluta officia itaque harum repellendus consequatur distinctio facere, ex alias dolore mollitia libero natus! Cum, sunt? Laboriosam placeat harum earum doloremque, quis velit libero corporis dolorum. Nulla alias minima aut assumenda odio cupiditate laboriosam nostrum magni. Dicta incidunt voluptates ullam atque magnam nisi numquam, beatae explicabo libero impedit sit voluptatibus expedita. Nisi nihil magnam minima nostrum itaque!',
    harga: 100000,
    stok: 10,
    gambar: 'assets/images/toko/bayam1.png',
  ),
  Toko(
    title: 'Kubis',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aut odio, nostrum, molestias fuga magni unde enim iusto deleniti expedita quidem inventore itaque ut aliquam eaque, recusandae provident eius. Incidunt, quis adipisci eius similique omnis quidem voluptates impedit quaerat sed provident quod iure laudantium soluta officia itaque harum repellendus consequatur distinctio facere, ex alias dolore mollitia libero natus! Cum, sunt? Laboriosam placeat harum earum doloremque, quis velit libero corporis dolorum. Nulla alias minima aut assumenda odio cupiditate laboriosam nostrum magni. Dicta incidunt voluptates ullam atque magnam nisi numquam, beatae explicabo libero impedit sit voluptatibus expedita. Nisi nihil magnam minima nostrum itaque!',
    harga: 20000,
    stok: 5,
    gambar: 'assets/images/toko/kubis.png',
  ),
  Toko(
    title: 'Terong',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aut odio, nostrum, molestias fuga magni unde enim iusto deleniti expedita quidem inventore itaque ut aliquam eaque, recusandae provident eius. Incidunt, quis adipisci eius similique omnis quidem voluptates impedit quaerat sed provident quod iure laudantium soluta officia itaque harum repellendus consequatur distinctio facere, ex alias dolore mollitia libero natus! Cum, sunt? Laboriosam placeat harum earum doloremque, quis velit libero corporis dolorum. Nulla alias minima aut assumenda odio cupiditate laboriosam nostrum magni. Dicta incidunt voluptates ullam atque magnam nisi numquam, beatae explicabo libero impedit sit voluptatibus expedita. Nisi nihil magnam minima nostrum itaque!',
    harga: 20000,
    stok: 5,
    gambar: 'assets/images/toko/terong.png',
  ),
  Toko(
    title: 'Jagung',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aut odio, nostrum, molestias fuga magni unde enim iusto deleniti expedita quidem inventore itaque ut aliquam eaque, recusandae provident eius. Incidunt, quis adipisci eius similique omnis quidem voluptates impedit quaerat sed provident quod iure laudantium soluta officia itaque harum repellendus consequatur distinctio facere, ex alias dolore mollitia libero natus! Cum, sunt? Laboriosam placeat harum earum doloremque, quis velit libero corporis dolorum. Nulla alias minima aut assumenda odio cupiditate laboriosam nostrum magni. Dicta incidunt voluptates ullam atque magnam nisi numquam, beatae explicabo libero impedit sit voluptatibus expedita. Nisi nihil magnam minima nostrum itaque!',
    harga: 20000,
    stok: 5,
    gambar: 'assets/images/toko/jagung.png',
  ),
];
