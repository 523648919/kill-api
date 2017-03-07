package com.kill.service;

import com.kill.dao.OrderDao;
import com.kill.dao.SeckillDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by OF on 2016/12/10.
 */
@Service
public class SeckillService {
    @Autowired
    private SeckillDao seckillDao;
    @Autowired
    private OrderDao orderDao;
    public List<Map<String, Object>> querySecKillList() {

        return seckillDao.querySecKillList();
    }
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void kill(String id,  String mobile) {
        int result =  orderDao.queryByOrderCheck(id, mobile);
        if(result >=1){
            throw new RuntimeException("用户已经购买!");
        }
        seckillDao.updateKillNumber(id);
        orderDao.insertOrderInfo(id, mobile);
    }

    public Map<String, Object> querySecKillDetail(String seckillId) {
        return seckillDao.querySecKillDetail(seckillId);
    }
}
