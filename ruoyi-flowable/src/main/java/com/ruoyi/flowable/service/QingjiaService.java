package com.ruoyi.flowable.service;

import com.ruoyi.flowable.domain.Qingjia;

public interface QingjiaService {

    Qingjia selectByTaskId(String taskId);

    int insert(Qingjia qingjia);
}
