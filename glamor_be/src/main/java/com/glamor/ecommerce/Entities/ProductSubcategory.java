package com.glamor.ecommerce.Entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "product_subcategory")
public class ProductSubcategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "subcategory_id")
    private Subcategory subcategory;
}
