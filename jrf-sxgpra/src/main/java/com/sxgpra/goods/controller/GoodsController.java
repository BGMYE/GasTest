package com.sxgpra.goods.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.sxgpra.goods.domain.Goods;
import com.sxgpra.goods.service.IGoodsService;

/**
 * 商品信息Controller
 */
@RestController
@RequestMapping("/sxgpra/goods")
public class GoodsController extends BaseController {
    @Autowired
    private IGoodsService goodsService;

    /**
     * 查询商品信息列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Goods fGoods) {
        startPage();
        List<Goods> list = goodsService.selectGoodsList(fGoods);
        return getDataTable(list);
    }

    /**
     * 导出商品信息列表
     */
    @Log(title = "商品信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Goods goods) {
        List<Goods> list = goodsService.selectGoodsList(goods);
        ExcelUtil<Goods> util = new ExcelUtil<Goods>(Goods.class);
        util.exportExcel(response, list, "商品信息数据");
    }

    /**
     * 获取商品信息详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id) {
        return success(goodsService.selectGoodsById(id));
    }

    /**
     * 新增商品信息
     */
    @PreAuthorize("@ss.hasPermi('logic:goods:add')")
    @Log(title = "商品信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Goods goods) {
        return toAjax(goodsService.insertGoods(goods));
    }

    /**
     * 修改商品信息
     */
    @Log(title = "商品信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Goods goods) {
        return toAjax(goodsService.updateGoods(goods));
    }

    /**
     * 删除商品信息
     */
    @Log(title = "商品信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids) {
        return toAjax(goodsService.deleteGoodsByIds(ids));
    }
}