package com.nchu.software.mailbox.entity;

import lombok.Data;

/**
 * @author 3162748949fgh
 * @program NCHU_Software_Website
 * @description 提交评价
 * @create 2019-01-09 11:11
 */
@Data
public class Commit {
    private Integer mailboxreplyid; //回复信箱id
    private Integer satisfied; //满意度
}
