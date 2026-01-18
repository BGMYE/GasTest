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
import com.sxgpra.domain.GasAreaManage;
import com.sxgpra.service.IGasAreaManageService;
import com.ruoyi.common.utils.poi.ExcelMergeExportUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 监检区域分配Controller
 * 
 * @author 岳鑫
 * @date 2026-01-01
 */
@RestController
@RequestMapping("/sxgpra/gasAreaManage")
public class GasAreaManageController extends BaseController
{
    @Autowired
    private IGasAreaManageService gasAreaManageService;

    /**
     * 查询监检区域分配列表
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasAreaManage:list')")
    @GetMapping("/list")
    public TableDataInfo list(GasAreaManage gasAreaManage)
    {
        startPage();
        List<GasAreaManage> list = gasAreaManageService.selectGasAreaManageList(gasAreaManage);
        return getDataTable(list);
    }

    /**
     * 查询监检区域分配列表不分页
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasAreaManage:list')")
    @GetMapping("/listAll")
    public TableDataInfo listAll(GasAreaManage gasAreaManage)
    {
        List<GasAreaManage> list = gasAreaManageService.selectGasAreaManageList(gasAreaManage);
        return getDataTable(list);
    }

    /**
     * 导出监检区域分配列表
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasAreaManage:export')")
    @Log(title = "监检区域分配", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GasAreaManage gasAreaManage)
    {
        List<GasAreaManage> list = gasAreaManageService.selectGasAreaManageList(gasAreaManage);
        ExcelMergeExportUtil.exportWithMerge(response, list,  "监检区域分配数据");
    }

    /**
     * 获取监检区域分配详细信息
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasAreaManage:query')")
    @GetMapping(value = "/getInfo/{areaManageId}")
    public AjaxResult getInfo(@PathVariable("areaManageId") Long areaManageId)
    {
        return success(gasAreaManageService.selectGasAreaManageByAreaManageId(areaManageId));
    }

    /**
     * 新增监检区域分配
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasAreaManage:add')")
    @Log(title = "监检区域分配", businessType = BusinessType.INSERT)
    @PostMapping("/insert")
    public AjaxResult add(@RequestBody GasAreaManage gasAreaManage)
    {
        return toAjax(gasAreaManageService.insertGasAreaManage(gasAreaManage));
    }

    /**
     * 修改监检区域分配
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasAreaManage:edit')")
    @Log(title = "监检区域分配", businessType = BusinessType.UPDATE)
    @PutMapping("/update")
    public AjaxResult edit(@RequestBody GasAreaManage gasAreaManage)
    {
        return toAjax(gasAreaManageService.updateGasAreaManage(gasAreaManage));
    }

    /**
     * 删除监检区域分配
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:gasAreaManage:remove')")
    @Log(title = "监检区域分配", businessType = BusinessType.DELETE)
	@DeleteMapping("/remove/{areaManageIds}")
    public AjaxResult remove(@PathVariable Long[] areaManageIds)
    {
        return toAjax(gasAreaManageService.deleteGasAreaManageByAreaManageIds(areaManageIds));
    }
}
