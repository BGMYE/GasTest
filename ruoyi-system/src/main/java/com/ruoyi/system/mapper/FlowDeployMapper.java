package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.FlowProcDefDto;

import java.util.List;

/**
 * 流程定义查询
 *
 * @author Tony
 * @email
 * @date 2022/1/29 5:44 下午
 **/
public interface FlowDeployMapper {

    /**
     * 流程定义列表
     * @param name
     * @return
     */
    List<FlowProcDefDto> selectDeployList(String name);

    /**
     * 根据流程key查询所有版本
     * @param processKey
     * @return
     */
    List<FlowProcDefDto> selectDeployListByKey(String processKey);
}
