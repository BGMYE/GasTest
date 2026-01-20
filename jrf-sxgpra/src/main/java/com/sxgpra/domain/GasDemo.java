package com.sxgpra.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ruoyi.common.core.domain.TreeEntity;

/**
 * 示例树对象 gas_demo
 * 
 * @author xatu
 * @date 2026-01-20
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class GasDemo extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 示例ID */
    private String demoId;

    /** 示例代码 */
    @Excel(name = "示例代码")
    private String demoCode;

    /** 示例名称 */
    @Excel(name = "示例名称")
    private String demoName;

}
