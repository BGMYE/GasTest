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
import com.sxgpra.domain.GasDemo;
import com.sxgpra.service.IGasDemoService;
import com.ruoyi.common.utils.poi.ExcelMergeExportUtil;

/**
 * 示例树Controller
 * 
 * @author xatu
 * @date 2026-01-20
 */
@RestController
@RequestMapping("/sxgpra/demo")
public class GasDemoController extends BaseController
{
    @Autowired
    private IGasDemoService gasDemoService;

    /**
     * 查询示例树列表
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:demo:list')")
    @GetMapping("/list")
    public AjaxResult list(GasDemo gasDemo)
    {
        List<GasDemo> list = gasDemoService.selectGasDemoList(gasDemo);
        return success(list);
    }

    /**
     * 查询示例树列表不分页
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:demo:list')")
    @GetMapping("/listAll")
        public AjaxResult listAll(GasDemo gasDemo)
        {
            List<GasDemo> list = gasDemoService.selectGasDemoList(gasDemo);
            return success(list);
        }

    /**
     * 导出示例树列表
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:demo:export')")
    @Log(title = "示例树", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GasDemo gasDemo)
    {
        List<GasDemo> list = gasDemoService.selectGasDemoList(gasDemo);
        ExcelMergeExportUtil.exportWithMerge(response, list,  "示例树数据");
    }

    /**
     * 获取示例树详细信息
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:demo:query')")
    @GetMapping(value = "/getInfo/{demoId}")
    public AjaxResult getInfo(@PathVariable("demoId") String demoId)
    {
        return success(gasDemoService.selectGasDemoByDemoId(demoId));
    }

    /**
     * 新增示例树
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:demo:add')")
    @Log(title = "示例树", businessType = BusinessType.INSERT)
    @PostMapping("/insert")
    public AjaxResult add(@RequestBody GasDemo gasDemo)
    {
        return toAjax(gasDemoService.insertGasDemo(gasDemo));
    }

    /**
     * 修改示例树
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:demo:edit')")
    @Log(title = "示例树", businessType = BusinessType.UPDATE)
    @PutMapping("/update")
    public AjaxResult edit(@RequestBody GasDemo gasDemo)
    {
        return toAjax(gasDemoService.updateGasDemo(gasDemo));
    }

    /**
     * 删除示例树
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:demo:remove')")
    @Log(title = "示例树", businessType = BusinessType.DELETE)
	@DeleteMapping("/remove/{demoIds}")
    public AjaxResult remove(@PathVariable String[] demoIds)
    {
        return toAjax(gasDemoService.deleteGasDemoByDemoIds(demoIds));
    }
}
