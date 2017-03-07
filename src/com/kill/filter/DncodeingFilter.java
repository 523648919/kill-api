package com.kill.filter;


import com.kill.action.RequestParams;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by OF on 2017/1/6.
 */
public class DncodeingFilter implements Filter {
    private String encoding ;
    private boolean forceEncoding ;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        encoding = filterConfig.getInitParameter("encoding");
        if ("true".equals(filterConfig.getInitParameter("forceEncoding"))) {
            forceEncoding = true;
        } else {
            forceEncoding = false;
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse response =(HttpServletResponse) servletResponse;
        HttpServletRequest request =(HttpServletRequest) servletRequest;
        response.setHeader("Access-Control-Allow-Origin", "*");
        if (servletRequest.getCharacterEncoding() == null) {
            servletRequest.setCharacterEncoding(encoding);
            if (forceEncoding) {
                response.setCharacterEncoding(encoding);
            }
        }
        RequestParams.setRequestParams(request);
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }

}
