package com.dj.ssm.pojo;

import lombok.Data;

import java.util.List;

@Data
public class UserQuery {

    private String userName;

    private Integer startAge;

    private Integer endAge;

    private List<Integer> userSex;

}
