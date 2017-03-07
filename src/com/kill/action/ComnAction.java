package com.kill.action;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by OF on 2016/11/3.
 */
@Controller
public class ComnAction {
    @RequestMapping(value = "/index")
    public ModelAndView testAction(HttpServletRequest request, HttpServletResponse response, ModelMap modeMap) {
        modeMap.addAttribute("username", "of");
        return new ModelAndView("/index", modeMap);
    }
    @RequestMapping(value = "/cj")
    public ModelAndView order(HttpServletRequest request, HttpServletResponse response, ModelMap modeMap) {
        return new ModelAndView("/cj", modeMap);
    }
    @RequestMapping(value = "/list")
    public ModelAndView list(HttpServletRequest request, HttpServletResponse response, ModelMap modeMap) {
        return new ModelAndView("/list", modeMap);
    } @RequestMapping(value = "/hj")
    public ModelAndView hj(HttpServletRequest request, HttpServletResponse response, ModelMap modeMap) {
        return new ModelAndView("/hj", modeMap);
    }
    @RequestMapping(value = "/f")
    public ModelAndView f(HttpServletRequest request, HttpServletResponse response, ModelMap modeMap,String p ) {
       Map<String,String []> map =  request.getParameterMap();
        Map params = new HashMap();
        for(String key :map.keySet()){
            for(String value :map.get(key)){
                params.put(key,value);
            }
        }
        System.out.println(params);
        modeMap.addAttribute("username", "of");
        return new ModelAndView(p, modeMap);
    }
}
