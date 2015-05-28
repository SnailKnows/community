package com.community.interceptor;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.community.domain.User;
import com.community.service.UserService;
import com.community.util.CookieUtils;

public class AuthorityInterceptor implements HandlerInterceptor {
	private static final Logger logger = LoggerFactory
			.getLogger(AuthorityInterceptor.class);
	@Autowired
	private UserService userService;

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler, ModelAndView arg3)
			throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Object obj = request.getSession().getAttribute("myUid");
		String servletPath = request.getServletPath();
		if (obj != null) {
			if (servletPath.equals("/")) {
				response.sendRedirect("home");
				return false;
			}
			return true;
		}
		long myUid = CookieUtils.getUidFromCookie(request);
		if (myUid == 0) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		User user = userService.getUserById(myUid);
		user.setLastLoginTime(user.getLoginTime());
		user.setLoginTime(new Timestamp(System.currentTimeMillis()));
		user.setStatus(1);
		boolean success = userService.updateUser(user);
		if (!success) {
			logger.warn("更新登录时间失败，uid:{}", myUid);
		}
		request.getSession().setAttribute("myUid", myUid);
		if (servletPath.equals("/")) {
			response.sendRedirect("home");
			return false;
		}
		return true;
	}
}