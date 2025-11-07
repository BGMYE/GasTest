package com.ruoyi.flowable.mapper;

import com.ruoyi.flowable.domain.Qingjia;

/**
 * @author ：byH
 * @date ：Created 2025/8/18 16:59
 * @description：
 */
public interface QingjiaMapper {

    public Qingjia selectByTaskId(String taskId);

    int insert(Qingjia qingjia);
}
