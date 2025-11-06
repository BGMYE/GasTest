package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 流程表单对象 sys_task_form
 *
 * @author Tony
 * @date 2021-03-30
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysForm extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 表单主键
     */
    private Long formId;

    /**
     * 表单名称
     */
    @Excel(name = "表单名称")
    private String formName;

    /**
     * 表单内容
     */
    @Excel(name = "表单内容")
    private String formContent;

    /**
     * 表单路由
     */
    @Excel(name = "表单路由")
    private String formRouter;
    /**
     * 表单提交方法
     */
    @Excel(name = "表单提交方法")
    private String formSubmit;

}
