package com.example.jpetstore.vo;

import lombok.Data;

@Data
public class PagingVo {
    private String userId;
    private Integer offset;
    private Integer limit;

    public PagingVo(String userId, Integer offset, Integer limit) {
        this.userId = userId;
        this.offset = offset;
        this.limit = limit;
    }
}