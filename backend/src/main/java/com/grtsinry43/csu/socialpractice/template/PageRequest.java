package com.grtsinry43.csu.socialpractice.template;

import com.grtsinry43.csu.socialpractice.constant.CommonConstant;
import lombok.Data;

/**
 * 分页请求
 *
 * @author grtsinry43
 * @date 2024/9/1 16:02
 */
@Data
public class PageRequest {

    /**
     * 当前页号
     */
    private int current = 1;

    /**
     * 页面大小
     */
    private int pageSize = 10;

    /**
     * 排序字段
     */
    private String sortField;

    /**
     * 排序顺序（默认升序）
     */
    private String sortOrder = CommonConstant.SORT_ORDER_ASC;
}
