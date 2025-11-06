package com.ruoyi.flowable.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.flowable.domain.FlowInitiatorConfig;
import com.ruoyi.flowable.service.IFlowInitiatorConfigService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 流程发起人配置Controller
 * 
 * @author ruoyi
 * @date 2024-01-01
 */
@RestController
@RequestMapping("/flowable/initiatorConfig")
public class FlowInitiatorConfigController extends BaseController
{
    @Autowired
    private IFlowInitiatorConfigService flowInitiatorConfigService;

    /**
     * 查询流程发起人配置列表
     */
    @PreAuthorize("@ss.hasPermi('flowable:initiatorConfig:list')")
    @GetMapping("/list")
    public TableDataInfo list(FlowInitiatorConfig flowInitiatorConfig)
    {
        startPage();
        List<FlowInitiatorConfig> list = flowInitiatorConfigService.selectFlowInitiatorConfigList(flowInitiatorConfig);
        return getDataTable(list);
    }

    /**
     * 导出流程发起人配置列表
     */
    @PreAuthorize("@ss.hasPermi('flowable:initiatorConfig:export')")
    @Log(title = "流程发起人配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FlowInitiatorConfig flowInitiatorConfig)
    {
        List<FlowInitiatorConfig> list = flowInitiatorConfigService.selectFlowInitiatorConfigList(flowInitiatorConfig);
        ExcelUtil<FlowInitiatorConfig> util = new ExcelUtil<FlowInitiatorConfig>(FlowInitiatorConfig.class);
        util.exportExcel(response, list, "流程发起人配置数据");
    }

    /**
     * 获取流程发起人配置详细信息
     */
    @PreAuthorize("@ss.hasPermi('flowable:initiatorConfig:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(flowInitiatorConfigService.selectFlowInitiatorConfigById(id));
    }

    /**
     * 根据流程定义ID获取发起人配置
     */
    @GetMapping(value = "/procDef/{procDefId}")
    public AjaxResult getByProcDefId(@PathVariable("procDefId") String procDefId)
    {
        List<FlowInitiatorConfig> list = flowInitiatorConfigService.selectFlowInitiatorConfigByProcDefId(procDefId);
        return success(list);
    }

    /**
     * 根据流程定义Key获取发起人配置
     */
    @GetMapping(value = "/procDefKey/{procDefKey}")
    public AjaxResult getByProcDefKey(@PathVariable("procDefKey") String procDefKey)
    {
        List<FlowInitiatorConfig> list = flowInitiatorConfigService.selectFlowInitiatorConfigByProcDefKey(procDefKey);
        return success(list);
    }

    /**
     * 新增流程发起人配置
     */
    @PreAuthorize("@ss.hasPermi('flowable:initiatorConfig:add')")
    @Log(title = "流程发起人配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FlowInitiatorConfig flowInitiatorConfig)
    {
        return toAjax(flowInitiatorConfigService.insertFlowInitiatorConfig(flowInitiatorConfig));
    }

    /**
     * 修改流程发起人配置
     */
    @PreAuthorize("@ss.hasPermi('flowable:initiatorConfig:edit')")
    @Log(title = "流程发起人配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FlowInitiatorConfig flowInitiatorConfig)
    {
        return toAjax(flowInitiatorConfigService.updateFlowInitiatorConfig(flowInitiatorConfig));
    }

    /**
     * 删除流程发起人配置
     */
    @PreAuthorize("@ss.hasPermi('flowable:initiatorConfig:remove')")
    @Log(title = "流程发起人配置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(flowInitiatorConfigService.deleteFlowInitiatorConfigByIds(ids));
    }

    /**
     * 保存流程发起人配置（批量保存）
     */
    @PreAuthorize("@ss.hasPermi('flowable:initiatorConfig:save')")
    @Log(title = "流程发起人配置", businessType = BusinessType.UPDATE)
    @PostMapping("/save")
    public AjaxResult save(@RequestBody FlowInitiatorConfigSaveRequest request)
    {
        return toAjax(flowInitiatorConfigService.saveFlowInitiatorConfig(
            request.getProcDefId(), 
            request.getProcDefKey(), 
            request.getDeployId(), 
            request.getConfigList()
        ));
    }

    /**
     * 检查用户是否有权限发起指定流程
     */
    @GetMapping("/checkPermission/{procDefId}")
    public AjaxResult checkPermission(@PathVariable("procDefId") String procDefId)
    {
        Long userId = getUserId();
        boolean canStart = flowInitiatorConfigService.checkUserCanStartProcess(procDefId, userId);
        return success(canStart);
    }

    /**
     * 流程发起人配置保存请求对象
     */
    public static class FlowInitiatorConfigSaveRequest {
        private String procDefId;
        private String procDefKey;
        private String deployId;
        private List<FlowInitiatorConfig> configList;

        public String getProcDefId() {
            return procDefId;
        }

        public void setProcDefId(String procDefId) {
            this.procDefId = procDefId;
        }

        public String getProcDefKey() {
            return procDefKey;
        }

        public void setProcDefKey(String procDefKey) {
            this.procDefKey = procDefKey;
        }

        public String getDeployId() {
            return deployId;
        }

        public void setDeployId(String deployId) {
            this.deployId = deployId;
        }

        public List<FlowInitiatorConfig> getConfigList() {
            return configList;
        }

        public void setConfigList(List<FlowInitiatorConfig> configList) {
            this.configList = configList;
        }
    }
}