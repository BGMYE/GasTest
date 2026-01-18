package com.sxgpra.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 商品信息对象 goods
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class Goods extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** id */
    private String id;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String goodsName;

    /** 商品分类 */
    @Excel(name = "商品分类")
    private String goodsType;

    /** 商品价格 */
    @Excel(name = "商品价格")
    private String goodsPrice;

    /** 商品库存 */
    @Excel(name = "商品库存")
    private String goodsInventory;

    /** 创建人名称 */
    @Excel(name = "创建人名称")
    private String createName;

    /** 更新人名称 */
    @Excel(name = "更新人名称")
    private String updateName;

    /** 删除标识 */
    private String delFlag;

    /** 商品图片 */
    @Excel(name = "商品图片")
    private String imgUrl;


}