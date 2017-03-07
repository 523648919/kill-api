package com.kill.action;

import com.kill.service.OrderService;
import com.kill.service.SeckillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by OF on 2016/11/18.
 */
@Controller
public class KillAction {
    @Autowired
    private OrderService orderService;
    @Autowired
    private SeckillService seckillService;

    @RequestMapping(value = "/querySecKillList")
    @ResponseBody
    public Model testActionUser(HttpServletRequest request, HttpServletResponse response, Model model) {
        List<Map<String, Object>> list = seckillService.querySecKillList();
        Map<String, Object> mapa = new HashMap();
        mapa.put("name", "产品一");
        mapa.put("date", "23/11/2013");
        mapa.put("status", "未开始");
        Map<String, Object> mapb = new HashMap();
        mapb.put("name", "产品二");
        mapb.put("date", "23/11/2013");
        mapb.put("status", "秒杀中");
        Map<String, Object> mapc = new HashMap();
        mapc.put("name", "产品三");
        mapc.put("date", "20/10/2013");
        mapc.put("status", "已结束");
        Map<String, Object> mapd = new HashMap();
        mapd.put("name", "产品四");
        mapd.put("date", "20/10/2013");
        mapd.put("status", "已结束");
        List<Map<String, Object>> stringObjectMap = new ArrayList<Map<String, Object>>();
        stringObjectMap.add(mapa);
        stringObjectMap.add(mapb);
        stringObjectMap.add(mapc);
        stringObjectMap.add(mapd);
        model.addAttribute("retCode", "0000");
        model.addAttribute("retMsg", "处理成功");
        model.addAttribute("list", list);
        return model;
    }



    @RequestMapping(value = "/detail")
    @ResponseBody
    public ModelMap  querySecKillDetail ( HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        String seckillId = request.getParameter("id").toString();
        Map<String, Object> result = seckillService.querySecKillDetail(seckillId);
        Object [] obj = result.get("start_time").toString().split(",");
        result.put("obj",obj);
        model.addAttribute("data",result);
        model.addAttribute("retCode", "0000");
        model.addAttribute("retMsg", "处理成功");
        return   model;
    }
    @RequestMapping(value = "/queryOrderList")
    @ResponseBody
    public Model order(HttpServletRequest request, HttpServletResponse response, Model model) {
        List<Map<String, Object>> list = orderService.queryOrderList();
        model.addAttribute("retCode", "0000");
        model.addAttribute("retMsg", "处理成功");
        model.addAttribute("list", list);
        return model;
    }

    @RequestMapping(value = "/kill")
    @ResponseBody
    public Model insertOrder(HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
        String mobile= request.getParameter("mobile").toString();
        String id = request.getParameter("id") ;
        seckillService.kill(id, mobile);
        model.addAttribute("retCode", "0000");
        model.addAttribute("retMsg", "处理成功");
        }catch (Exception e ){
            e.printStackTrace();
            model.addAttribute("retCode", "9999");
            model.addAttribute("retMsg", e.getMessage()==null?"处理失败!":e.getMessage());
            return model;
        }
        return model;
    }

    @RequestMapping(value = "/queryCjList")
    @ResponseBody
    public Model cj(HttpServletRequest request, HttpServletResponse response, Model model) {
        List<Map<String, Object>> list = orderService.queryCjList();
        model.addAttribute("retCode", "0000");
        model.addAttribute("retMsg", "处理成功");
        model.addAttribute("list", list);
        return model;
    }
    @RequestMapping(value = "/queryEmpoyeeList")
    @ResponseBody
    public Model queryEmpoyeeList(HttpServletRequest request, HttpServletResponse response, Model model) {
        String status= request.getParameter("status").toString();
        String employeeName= request.getParameter("employee_name").toString();
        String employeeNo= request.getParameter("employee_no").toString();
        String pageNum= request.getParameter("page_num").toString();

        Map<String,Object> params = new HashMap<String,Object>();
        // 分页处理每页显示器10条
        int page = 1;
        if (pageNum != null) {
            page = Integer.valueOf(pageNum.toString())
                    .intValue();
        }
        // 每页显示条数
        int num = 9;
        params.put("start", (page - 1) * num);
        params.put("limit", num);
        params.put("status", status);
        params.put("employee_name", employeeName);
        params.put("employee_no", employeeNo);
        List<Map<String, Object>> list = orderService.queryEmpoyeeList(params);
        String results = orderService.queryEmpoyeeListCount(status) ;
        model.addAttribute("retCode", "0000");
        model.addAttribute("retMsg", "处理成功");
        model.addAttribute("results", results);
        model.addAttribute("limit", num);
        model.addAttribute("page_num", pageNum);
        model.addAttribute("list", list);
        return model;
    }

    @RequestMapping(value = "/updateEmpoyee")
    @ResponseBody
    public Model updateEmpoyee(HttpServletRequest request, HttpServletResponse response, Model model) {
        String status= request.getParameter("status").toString();
        String id= request.getParameter("id").toString();
        String remark= request.getParameter("remark").toString();
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("status",status);
        params.put("id",id);
        params.put("remark",remark);
        orderService.updateEmpoyee(params);
        model.addAttribute("retCode", "0000");
        model.addAttribute("retMsg", "处理成功");
        return model;
    }
}
