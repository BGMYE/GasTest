package com.ruoyi.flowable.service.impl;

import com.ruoyi.flowable.mapper.QingjiaMapper;
import com.ruoyi.flowable.service.QingjiaService;
import com.ruoyi.flowable.domain.Qingjia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ：byH
 * @date ：Created 2025/8/18 16:56
 * @description：
 */
@Service
public class QingjiaServiceImpl implements QingjiaService {
    @Autowired
    private QingjiaMapper qingjiaMapper;

    @Override
    public Qingjia selectByTaskId(String taskId) {
        return qingjiaMapper.selectByTaskId(taskId);
    }

    @Override
    public int insert(Qingjia qingjia) {
        return qingjiaMapper.insert(qingjia);
    }
}
