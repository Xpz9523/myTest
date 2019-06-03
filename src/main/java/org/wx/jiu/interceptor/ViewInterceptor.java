package org.wx.jiu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/******************************
 * 
 * @author GG 控制前台登录权限验证
 *
 */
public class ViewInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.err.println("==调用前台拦截器==");
		if (request.getSession().getAttribute("loginName") != null) {
			// 表示合法用户
			return true; // 通过验证
		}
		// 非法用户请求
		// response.sendRedirect(request.getContextPath() + "/test");
		response.sendRedirect(request.getContextPath() + "/Wine/login");
		return false;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
