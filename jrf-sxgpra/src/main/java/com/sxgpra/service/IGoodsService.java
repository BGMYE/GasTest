package com.sxgpra.service;

import java.util.List;

import com.sxgpra.domain.Goods;

/**
 * 商品信息Service接口
 */
public interface IGoodsService 
{
    /**
     * 查询商品信息
     * 
     * @param id 商品信息主键
     * @return 商品信息
     */
    public Goods selectGoodsById(String id);

    /**
     * 查询商品信息列表
     * 
     * @param fGoods 商品信息
     * @return 商品信息集合
     */
    public List<Goods> selectGoodsList(Goods fGoods);

    /**
     * 新增商品信息
     * 
     * @param fGoods 商品信息
     * @return 结果
     */
    public int insertGoods(Goods fGoods);

    /**
     * 修改商品信息
     * 
     * @param fGoods 商品信息
     * @return 结果
     */
    public int updateGoods(Goods fGoods);

    /**
     * 批量删除商品信息
     * 
     * @param ids 需要删除的商品信息主键集合
     * @return 结果
     */
    public int deleteGoodsByIds(String[] ids);

    /**
     * 删除商品信息信息
     * 
     * @param id 商品信息主键
     * @return 结果
     */
    public int deleteGoodsById(String id);
}