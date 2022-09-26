
# Glamor Ecommerce Project
Glamor e-ticaret projesinin açık kaynak kodudur.
#### Öğeyi getirme metodları (GET)

```http
  /api/v1/product/get/products
  /api/v1/product/get/${productId}
  /api/v1/user/get/${userId}
  /api/v1/category/get/${categoryId}
  /api/v1/brand/get/${brandId}
```

#### Öğeyi gönderme metodları (POST)

```http
  /api/v1/product/create
  /api/v1/user/create
  /api/v1/brand/create
  /api/v1/category/create
  /api/v1/subcategory/create
```

Product Request
```JSON
{
  "title":"example",
  "description":"example",
  "price":999.99,
  "location":"example",
  "brand_id":0,
  "user_id":0,
  "product_subcategory":[0,1,2..]
}
```

User Request
```JSON
{
  "name":"example",
  "lastname":"example",
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