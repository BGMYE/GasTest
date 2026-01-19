package com.sxgpra.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 定位校验对象 gas_location_check
 * 
 * @author xatu
 * @date 2026-01-19
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class GasLocationCheck extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private String locationCheckId;

    /** 项目ID */
    @Excel(name = "项目ID")
    private String projectId;

    /** 焊工ID */
    @Excel(name = "焊工ID")
    private String welderId;

    /** 焊口编号 */
    @Excel(name = "焊口编号")
    private String manycode;

    /** 焊口精确定位方式 */
    @Excel(name = "焊口精确定位方式")
    private String locationtype;

    /** 埋深图片信息 */
    @Excel(name = "埋深图片信息")
    private String photo;

    /** 位置 */
    @Excel(name = "位置")
    private String location;

}
