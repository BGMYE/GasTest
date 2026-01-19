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
import com.sxgpra.domain.GasStudent;
import com.sxgpra.service.IGasStudentService;
import com.ruoyi.common.utils.poi.ExcelMergeExportUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 学生信息管理Controller
 * 
 * @author 测试
 * @date 2026-01-19
 */
@RestController
@RequestMapping("/sxgpra/GasStudent")
public class GasStudentController extends BaseController
{
    @Autowired
    private IGasStudentService gasStudentService;

    /**
     * 查询学生信息管理列表
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasStudent:list')")
    @GetMapping("/list")
    public TableDataInfo list(GasStudent gasStudent)
    {
        startPage();
        List<GasStudent> list = gasStudentService.selectGasStudentList(gasStudent);
        return getDataTable(list);
    }

    /**
     * 查询学生信息管理列表不分页
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasStudent:list')")
    @GetMapping("/listAll")
    public TableDataInfo listAll(GasStudent gasStudent)
    {
        List<GasStudent> list = gasStudentService.selectGasStudentList(gasStudent);
        return getDataTable(list);
    }

    /**
     * 导出学生信息管理列表
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasStudent:export')")
    @Log(title = "学生信息管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GasStudent gasStudent)
    {
        List<GasStudent> list = gasStudentService.selectGasStudentList(gasStudent);
        ExcelMergeExportUtil.exportWithMerge(response, list,  "学生信息管理数据");
    }

    /**
     * 获取学生信息管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasStudent:query')")
    @GetMapping(value = "/getInfo/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(gasStudentService.selectGasStudentById(id));
    }

    /**
     * 新增学生信息管理
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasStudent:add')")
    @Log(title = "学生信息管理", businessType = BusinessType.INSERT)
    @PostMapping("/insert")
    public AjaxResult add(@RequestBody GasStudent gasStudent)
    {
        return toAjax(gasStudentService.insertGasStudent(gasStudent));
    }

    /**
     * 修改学生信息管理
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasStudent:edit')")
    @Log(title = "学生信息管理", businessType = BusinessType.UPDATE)
    @PutMapping("/update")
    public AjaxResult edit(@RequestBody GasStudent gasStudent)
    {
        return toAjax(gasStudentService.updateGasStudent(gasStudent));
    }

    /**
     * 删除学生信息管理
     */
    @PreAuthorize("@ss.hasPermi('sxgpra:GasStudent:remove')")
    @Log(title = "学生信息管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/remove/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(gasStudentService.deleteGasStudentByIds(ids));
    }
}
