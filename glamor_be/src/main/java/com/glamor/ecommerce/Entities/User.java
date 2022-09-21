package com.glamor.ecommerce.Entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@NoArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(name = "UUID",strategy = "org.hibernate.id.UUIDGenerator")
    private String id;
}

/*
_Id ( PK )
_ProductsId ( FK , Default empty list )
_FavoritesId ( FK, Default empty list )
Firstname ( Required, String )
Lastname ( Required, String )
Email ( Required, String )
Password ( Required, String, Must be hashed )
ProfilePicture ( Nullable, String )
Subscribers ( Default empty list )
Subscriptions ( Default empty list )

??? TotalLiked ( Default 0, Number )
??? TotalFavorited ( Default 0, Number )
 */