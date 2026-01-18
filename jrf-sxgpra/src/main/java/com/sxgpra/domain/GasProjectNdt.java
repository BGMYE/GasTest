package com.sxgpra.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 项目检测单位对象 gas_project_ndt
 * 
 * @author xatu
 * @date 2026-01-18
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class GasProjectNdt extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 项目检测单位ID */
    @Excel(name = "项目检测单位ID")
    private String projectNdtId;

    /** 项目ID */
    @Excel(name = "项目ID")
    private String projectId;

    /** 机构ID */
    @Excel(name = "机构ID")
    private String deptId;

    /** 检测单位项目分责人 */
    @Excel(name = "检测单位项目分责人")
    private String ndtChargerId;

    /** 检测单位项目资料员 */
    @Excel(name = "检测单位项目资料员")
    private String ndtDocumenterId;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 删除标志 */
    private String delFlag;

    /** 检测资质证书编号 */
    @Excel(name = "检测资质证书编号")
    private String testCertNo;

}
