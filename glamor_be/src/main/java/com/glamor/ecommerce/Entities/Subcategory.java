package com.glamor.ecommerce.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
@Table(name = "subcategories")
public class Subcategory {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @Column(nullable = false)
        private String title;

        @ManyToOne(fetch = FetchType.EAGER)
        @JoinColumn(name = "category_id")
        @JsonIgnore
        @ToString.Exclude
        @EqualsAndHashCode.Exclude
        private Category category;

        @OneToMany(mappedBy = "subcategory")
        @JsonIgnore
        @ToString.Exclude
        @EqualsAndHashCode.Exclude
        private List<ProductSubcategory> product_subcategory;
}
