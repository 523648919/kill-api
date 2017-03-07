package com.kill.dao;


import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by OF on 2016/11/18.
 */
public interface OrderDao {
    /**
     * 插入订单
     * @param seckillid
     * @param phome
     * @return
     */
    int insertOrderInfo(@Param(value = "seckillid") String seckillid  ,@Param(value = "user_phone")  String user_phone);

    /**
     * 查验订单是否已经成功
     * @param seckillid
     * @return
     */
   int queryByOrderCheck(@Param(value = "seckillid") String seckillid  ,@Param(value = "user_phone")  String user_phone);

    List<Map<String,Object>> queryList();

    /**
     * 抽奖
     * @return
     */
    List<Map<String,Object>> queryCjList();

    List<Map<String,Object>> queryEmpoyeeList(Map<String,Object> params);

    String queryEmpoyeeListCount(@Param(value = "status") String status);

    void updateEmpoyee(Map<String, Object> params);
}
