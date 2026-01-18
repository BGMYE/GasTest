package com.sxgpra.goods.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.sxgpra.domain.Goods;
import com.sxgpra.mapper.GoodsMapper;
import com.sxgpra.service.IGoodsService;

/**
 * 商品信息Service业务层处理
 */
@Service
public class GoodsServiceImpl implements IGoodsService {
    @Autowired
    private GoodsMapper goodsMapper;

    /**
     * 查询商品信息
     *
     * @param id 商品信息主键
     * @return 商品信息
     */
    @Override
    public Goods selectGoodsById(String id) {
        return goodsMapper.selectGoodsById(id);
    }

    /**
     * 查询商品信息列表
     *
     * @param goods 商品信息
     * @return 商品信息
     */
    @Override
    public List<Goods> selectGoodsList(Goods goods) {
        return goodsMapper.selectGoodsList(goods);
    }

    /**
     * 新增商品信息
     *
     * @param goods 商品信息
     * @return 结果
     */
    @Override
    public int insertGoods(Goods goods) {
        if (goods.getId() == null) {
            goods.setId(IdUtils.fastSimpleUUID());
        }
        goods.setCreateTime(DateUtils.getNowDate());
        SysUser user = SecurityUtils.getLoginUser().getUser();
        goods.setCreateBy(user.getNickName());
        goods.setCreateName(String.valueOf(user.getUserId()));
        return goodsMapper.insertGoods(goods);
    }

    /**
     * 修改商品信息
     *
     * @param goods 商品信息
     * @return 结果
     */
    @Override
    public int updateGoods(Goods goods) {
        goods.setUpdateTime(DateUtils.getNowDate());
        SysUser user = SecurityUtils.getLoginUser().getUser();
        goods.setUpdateBy(user.getNickName());
        goods.setUpdateName(String.valueOf(user.getUserId()));
        return goodsMapper.updateGoods(goods);
    }

    /**
     * 批量删除商品信息
     *
     * @param ids 需要删除的商品信息主键
     * @return 结果
     */
    @Override
    public int deleteGoodsByIds(String[] ids) {
        return goodsMapper.deleteGoodsByIds(ids);
    }

    /**
     * 删除商品信息信息
     *
     * @param id 商品信息主键
     * @return 结果
     */
    @Override
    public int deleteGoodsById(String id) {
        return goodsMapper.deleteGoodsById(id);
    }
}
