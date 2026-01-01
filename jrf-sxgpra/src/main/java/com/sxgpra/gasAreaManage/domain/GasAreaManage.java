package com.sxgpra.gasAreaManage.domain;

import com.ruoyi.common.annotation.Excels;
import com.ruoyi.common.core.domain.entity.SysDept;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 监检区域分配对象 gas_area_manage
 * 
 * @author 岳鑫
 * @date 2026-01-01
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class GasAreaManage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 监检区域分配ID */
    private Long areaManageId;

    /** 监察机构ID */
    @Excel(name = "监察机构ID")
    private Long supervisionId;

    /** 监检机构ID */
    @Excel(name = "监检机构ID")
    private Long inspectionId;

    /** 安装区域代码 */
    @Excel(name = "安装区域代码")
    private String regionCode;

    /** 安装区域名称 */
    @Excel(name = "安装区域名称")
    private String regionName;

    /** 部门对象 */
    @Excels({
            @Excel(name = "监察机构名称", targetAttr = "deptName", type = Excel.Type.EXPORT),
            @Excel(name = "监察机构负责人", targetAttr = "leader", type = Excel.Type.EXPORT)
    })
    private SysDept supervisionDept;

    /** 部门对象 */
    @Excels({
            @Excel(name = "监检机构名称", targetAttr = "deptName", type = Excel.Type.EXPORT),
            @Excel(name = "监检机构负责人", targetAttr = "leader", type = Excel.Type.EXPORT)
    })
    private SysDept inspectionDept;

}
