package com.kill.service;

import com.kill.dao.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by OF on 2016/12/10.
 */
@Service
public class OrderService {
    @Autowired
    private OrderDao orderDao;
   public void insertOrderInfo(Map seckillid){
    }

    public List<Map<String,Object>> queryOrderList() {

        return orderDao.queryList();
    }


    public List<Map<String,Object>> queryCjList() {
        return orderDao.queryCjList();
    }

    public List<Map<String,Object>> queryEmpoyeeList(Map<String,Object> params) {
        return orderDao.queryEmpoyeeList(params);
    }

    public String  queryEmpoyeeListCount(String status) {

        return orderDao.queryEmpoyeeListCount(status);
    }

    public void updateEmpoyee(Map<String, Object> params) {
          orderDao.updateEmpoyee(params);
    }
}
