package com.ruoyi.flowable.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.FlowProcDefDto;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

/**
 * @author Tony
 * @date 2021-04-03 14:41
 */
public interface IFlowDefinitionService {

    boolean exist(String processDefinitionKey);


    /**
     * 流程定义列表
     *
     * @param pageNum  当前页码
     * @param pageSize 每页条数
     * @return 流程定义分页列表数据
     */
    Page<FlowProcDefDto> list(String name,Integer pageNum, Integer pageSize);

    /**
     * 导入流程文件
     * 当每个key的流程第一次部署时，指定版本为1。对其后所有使用相同key的流程定义，
     * 部署时版本会在该key当前已部署的最高版本号基础上加1。key参数用于区分流程定义
     * @param name
     * @param category
     * @param in
     * @return 部署信息，包含deployId和procDefId
     */
    Map<String, String> importFile(String name, String category, InputStream in);

    /**
     * 读取xml
     * @param deployId
     * @return
     */
    AjaxResult readXml(String deployId) throws IOException;

    /**
     * 根据流程定义ID启动流程实例
     *
     * @param procDefId
     * @param variables
     * @return
     */

    AjaxResult startProcessInstanceById(String procDefId, Map<String, Object> variables);


    /**
     * 激活或挂起流程定义
     *
     * @param state    状态
     * @param deployId 流程部署ID
     */
    void updateState(Integer state, String deployId);


    /**
     * 删除流程定义
     *
     * @param deployId 流程部署ID act_ge_bytearray 表中 deployment_id值
     */
    void delete(String deployId);


    /**
     * 读取图片文件
     * @param deployId
     * @return
     */
    InputStream readImage(String deployId);

    /**
     * 获取用户有权限发起的流程定义列表
     *
     * @param name     流程名称
     * @param pageNum  当前页码
     * @param pageSize 每页条数
     * @param userId   用户ID
     * @return 流程定义分页列表数据
     */
    Page<FlowProcDefDto> listWithPermission(String name, Integer pageNum, Integer pageSize, Long userId);

    /**
     * 获取流程历史版本列表
     *
     * @param processKey 流程标识
     * @return 历史版本列表
     */
    java.util.List<FlowProcDefDto> getProcessHistory(String processKey);

    /**
     * 删除流程历史版本
     *
     * @param deploymentId 部署ID
     */
    void deleteProcessHistory(String deploymentId);

    /**
     * 回退到指定版本
     *
     * @param sourceDeploymentId 源部署ID
     * @param processKey         流程标识
     * @param processName        流程名称
     * @return 新创建的流程定义信息
     */
    FlowProcDefDto rollbackToVersion(String sourceDeploymentId, String processKey, String processName);
}
