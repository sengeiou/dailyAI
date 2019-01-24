package com.axp.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
  
public class ExceptionInterceptor implements HandlerExceptionResolver {   
  
    @Override  
    public ModelAndView resolveException(HttpServletRequest request,   
            HttpServletResponse response, Object handler, Exception ex) {   
        return new ModelAndView("/error/exception");   
    }   
  
}  