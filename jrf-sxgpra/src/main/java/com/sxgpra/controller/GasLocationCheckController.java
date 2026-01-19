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
import com.sxgpra.domain.GasLocationCheck;
import com.sxgpra.service.IGasLocationCheckService;
import com.ruoyi.common.utils.poi.ExcelMergeExportUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 定位校验Controller
 * 
 * @author xatu
 * @date 2026-01-19
 */
@RestController
@RequestMapping("/sxgpra/gasLocationCheck")
public class GasLocationCheckController extends BaseController
{
    @Autowired
    private IGasLocationCheckService gasLocationCheckService;

    /**
     * 查询定位校验列表
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasLocationCheck:list')")
    @GetMapping("/list")
    public TableDataInfo list(GasLocationCheck gasLocationCheck)
    {
        startPage();
        List<GasLocationCheck> list = gasLocationCheckService.selectGasLocationCheckList(gasLocationCheck);
        return getDataTable(list);
    }

    /**
     * 查询定位校验列表不分页
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasLocationCheck:list')")
    @GetMapping("/listAll")
    public TableDataInfo listAll(GasLocationCheck gasLocationCheck)
    {
        List<GasLocationCheck> list = gasLocationCheckService.selectGasLocationCheckList(gasLocationCheck);
        return getDataTable(list);
    }

    /**
     * 导出定位校验列表
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasLocationCheck:export')")
    @Log(title = "定位校验", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GasLocationCheck gasLocationCheck)
    {
        List<GasLocationCheck> list = gasLocationCheckService.selectGasLocationCheckList(gasLocationCheck);
        ExcelMergeExportUtil.exportWithMerge(response, list,  "定位校验数据");
    }

    /**
     * 获取定位校验详细信息
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasLocationCheck:query')")
    @GetMapping(value = "/getInfo/{locationCheckId}")
    public AjaxResult getInfo(@PathVariable("locationCheckId") String locationCheckId)
    {
        return success(gasLocationCheckService.selectGasLocationCheckByLocationCheckId(locationCheckId));
    }

    /**
     * 新增定位校验
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasLocationCheck:add')")
    @Log(title = "定位校验", businessType = BusinessType.INSERT)
    @PostMapping("/insert")
    public AjaxResult add(@RequestBody GasLocationCheck gasLocationCheck)
    {
        return toAjax(gasLocationCheckService.insertGasLocationCheck(gasLocationCheck));
    }

    /**
     * 修改定位校验
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasLocationCheck:edit')")
    @Log(title = "定位校验", businessType = BusinessType.UPDATE)
    @PutMapping("/update")
    public AjaxResult edit(@RequestBody GasLocationCheck gasLocationCheck)
    {
        return toAjax(gasLocationCheckService.updateGasLocationCheck(gasLocationCheck));
    }

    /**
     * 删除定位校验
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasLocationCheck:remove')")
    @Log(title = "定位校验", businessType = BusinessType.DELETE)
	@DeleteMapping("/remove/{locationCheckIds}")
    public AjaxResult remove(@PathVariable String[] locationCheckIds)
    {
        return toAjax(gasLocationCheckService.deleteGasLocationCheckByLocationCheckIds(locationCheckIds));
    }
}
