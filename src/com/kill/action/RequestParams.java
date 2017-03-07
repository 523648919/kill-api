package com.kill.action;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by OF on 2016/11/18.
 */
public class RequestParams {
    private static ThreadLocal<HttpServletRequest> local = new ThreadLocal<HttpServletRequest>();
    private static ThreadLocal<Map> localMap = new ThreadLocal<Map>();

    /**
     * 保存当前请求对象
     */
    public static void setRequestParams(HttpServletRequest request) {
        local.set(request);
    }

    /**
     * 获取当前请求对象
     */
    public static HttpServletRequest getLocalRequest() {
        return local.get();
    }

    /**
     * 清除threadlocal中的参数
     */
    public static void clearUserParams() {
        if (local.get() != null) {
            local.set(null);
        }
    }

    public static Map getParams() {
        if (localMap == null || localMap.get() == null) {
            setParams();
        }
        return localMap.get();
    }

    public static void setParams() {
        HttpServletRequest r = (HttpServletRequest) getLocalRequest();
        r.getContentType();
        Map<String, String[]> map = r.getParameterMap();
        Map params = new HashMap();
        for (String key : map.keySet()) {
            for (String value : map.get(key)) {
                params.put(key, value);
            }
        }
        localMap.set(params);
    }
}
