package com.kill.dao;


import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by OF on 2016/11/18.
 */
public interface SeckillDao {
    /**
     * 减库存
     *
     * @return
     */
    int reduceNumber(String seckillid);

    /**
     * 查一个秒杀对像
     *
     * @param seckillid
     * @return
     */
    public Map<String, Object> querySecKillById(String seckillid);

    /**
     * 查询所用秒杀记录
     *
     * @return
     */
    public List<Map<String, Object>> querySecKillList();

    Map<String,Object> querySecKillDetail(@Param(value = "seckillId") String seckillId);

    void updateKillNumber(@Param(value = "seckillid") String seckillid);
}
