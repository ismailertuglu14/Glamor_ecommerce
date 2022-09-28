
# Glamor Ecommerce Project
Glamor e-ticaret projesinin açık kaynak kodudur.
#### Öğeyi getirme metodları (GET)

```http
  /api/v1/product/all
  /api/v1/product/${productId}
  /api/v1/user/${userId}
  /api/v1/category/${categoryId}
  /api/v1/brand/${brandId}
  /api/v1/like/${likeId}
```

#### Öğeyi gönderme metodları (POST)

```http
  /api/v1/product/create
  /api/v1/user/create
  /api/v1/brand/create
  /api/v1/category/create
  /api/v1/subcategory/create
  /api/v1/like/create
  /api/v1/favorite/create
```

Product Request
```form-data
  "title":"example",
  "description":"example",
  "price":999.99,
  "location":"example",
  "images":[img1.jpg,img2.jpg..]
  "brand_id":0,
  "user_id":0,
  "product_subcategory":[0,1,2..]
```

Product Response
```JSON
{
    "title": "example",
    "description": "example",
    "price": 999.99,
    "location": "example",
    "brand": {
        "id": 1,
        "name": "example"
    },
    "user": {
        "id": 1,
        "name": "example",
        "lastname": "example",
        "email":"exmpl@domain.com",
        "password": "example",
        "avatar": "/avatars/example_1.jpg"
    },
    "subcategories": [
        {
            "id": 1,
            "title": "example"
        },
        {
            "id": 2,
            "title": "example"
        }
    ],
    "categories": [
        {
            "id": 1,
            "title": "example"
        }
    ],
    "images": [
        {
            "id": 1,
            "name": "img1.jpg",
            "directory": "example"
        },
        {
            "id": 2,
            "name": "img2.jpg",
            "directory": "example"
        }
    ],
    "total_like": 0
}
```

User Request
```JSON
{
  "name":"example",
  "lastname":"example",
  "email":"exmpl@domain.com",
  "password":"example",
  "avatar":"/images/avatar_1.jpg"
}
```

Brand Request
```JSON
{
  "name":"example"
}
```

Category Request
```JSON
{
  "title":"example"
}
```

Subcategory Request
```JSON
{
  "title":"example",
  "category_id":0
}
```

Like Request
```JSON
{
  "user_id":0,
  "product_id":0
}
```

Favorite Request
```JSON
{
  "user_id":0,
  "product_id":0
}
```