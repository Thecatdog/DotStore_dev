package com.example.jpetstore.vo;

import lombok.Data;

import java.sql.Timestamp;
import java.time.LocalDate;

@Data
public class DateVo {
    private String userId;
    private Timestamp startDate;
    private Timestamp endDate;

    public DateVo(String userId) {
        this.userId = userId;
        this.startDate = Timestamp.valueOf(LocalDate.now().atStartOfDay());
        this.endDate = Timestamp.valueOf(LocalDate.now().plusDays(1).atStartOfDay());
    }
}