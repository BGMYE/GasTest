package com.sxgpra.controller;

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
import com.sxgpra.domain.GasProjectNdt;
import com.sxgpra.service.IGasProjectNdtService;
import com.ruoyi.common.utils.poi.ExcelMergeExportUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 项目检测单位Controller
 * 
 * @author xatu
 * @date 2026-01-18
 */
@RestController
@RequestMapping("/sxgpra/GasProjectNdt")
public class GasProjectNdtController extends BaseController
{
    @Autowired
    private IGasProjectNdtService gasProjectNdtService;

    /**
     * 查询项目检测单位列表
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasProjectNdt:list')")
    @GetMapping("/list")
    public TableDataInfo list(GasProjectNdt gasProjectNdt)
    {
        startPage();
        List<GasProjectNdt> list = gasProjectNdtService.selectGasProjectNdtList(gasProjectNdt);
        return getDataTable(list);
    }

    /**
     * 查询项目检测单位列表不分页
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasProjectNdt:list')")
    @GetMapping("/listAll")
    public TableDataInfo listAll(GasProjectNdt gasProjectNdt)
    {
        List<GasProjectNdt> list = gasProjectNdtService.selectGasProjectNdtList(gasProjectNdt);
        return getDataTable(list);
    }

    /**
     * 导出项目检测单位列表
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasProjectNdt:export')")
    @Log(title = "项目检测单位", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GasProjectNdt gasProjectNdt)
    {
        List<GasProjectNdt> list = gasProjectNdtService.selectGasProjectNdtList(gasProjectNdt);
        ExcelMergeExportUtil.exportWithMerge(response, list,  "项目检测单位数据");
    }

    /**
     * 获取项目检测单位详细信息
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasProjectNdt:query')")
    @GetMapping(value = "/getInfo/{projectNdtId}")
    public AjaxResult getInfo(@PathVariable("projectNdtId") Long projectNdtId)
    {
        return success(gasProjectNdtService.selectGasProjectNdtByProjectNdtId(projectNdtId));
    }

    /**
     * 新增项目检测单位
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasProjectNdt:add')")
    @Log(title = "项目检测单位", businessType = BusinessType.INSERT)
    @PostMapping("/insert")
    public AjaxResult add(@RequestBody GasProjectNdt gasProjectNdt)
    {
        return toAjax(gasProjectNdtService.insertGasProjectNdt(gasProjectNdt));
    }

    /**
     * 修改项目检测单位
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasProjectNdt:edit')")
    @Log(title = "项目检测单位", businessType = BusinessType.UPDATE)
    @PutMapping("/update")
    public AjaxResult edit(@RequestBody GasProjectNdt gasProjectNdt)
    {
        return toAjax(gasProjectNdtService.updateGasProjectNdt(gasProjectNdt));
    }

    /**
     * 删除项目检测单位
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasProjectNdt:remove')")
    @Log(title = "项目检测单位", businessType = BusinessType.DELETE)
	@DeleteMapping("/remove/{projectNdtIds}")
    public AjaxResult remove(@PathVariable Long[] projectNdtIds)
    {
        return toAjax(gasProjectNdtService.deleteGasProjectNdtByProjectNdtIds(projectNdtIds));
    }
}
