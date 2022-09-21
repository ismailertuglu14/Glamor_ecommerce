package com.glamor.ecommerce.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import javax.persistence.*;

@Entity
@NoArgsConstructor
@RequiredArgsConstructor
public class Subcategory {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @Column(nullable = false)
        private String title;

        @ManyToOne(fetch = FetchType.LAZY)
        @JsonIgnore
        @ToString.Exclude
        @EqualsAndHashCode.Exclude
        @JoinColumn(name = "category_id",nullable = true)
        private Category category;
}
