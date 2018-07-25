package com.example.demo1.util;

import org.springframework.data.domain.Sort;

public class SortTools {
    public static Sort basicSort() {
        return basicSort("asc", "id");
    }

    public static Sort basicSort(String orderType, String orderField) {
        Sort sort = new Sort(Sort.Direction.fromString(orderType), orderField);
        return sort;
    }
}
