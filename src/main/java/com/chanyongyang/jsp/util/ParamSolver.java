package com.chanyongyang.jsp.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import com.chanyongyang.jsp.domain.Criteria;
import com.chanyongyang.jsp.domain.Member;

public class ParamSolver {
	public static final String UPLOAD_PATH = "c:/upload";
	
	public static <T> T getParams(HttpServletRequest req, Class<T> clazz) {
		T t = null;
		try {
			t = clazz.getDeclaredConstructor().newInstance();
			
			Field[] fields = clazz.getDeclaredFields();
			for(Field f : fields) {
				String fieldName = f.getName();
				String setterName = "set" + f.getName().substring(0, 1).toUpperCase() + fieldName.substring(1);
				Method[] methods = clazz.getDeclaredMethods();
				for(Method m : methods) {
					if(setterName.equals(m.getName())) {
						if(req.getParameter(fieldName) == null) {
							continue;
						}
						if(f.getType() == Integer.class || f.getType() == int.class) {
							m.invoke(t, Integer.parseInt(req.getParameter(fieldName)));
						}
						if(f.getType() == String.class) {
							m.invoke(t, req.getParameter(fieldName));
						}
						if(f.getType() == String[].class) {
							m.invoke(t, (Object)req.getParameterValues(fieldName));
						}
						if(f.getType() == Long.class || f.getType() == long.class) {
							m.invoke(t, Long.valueOf(req.getParameter(fieldName)));
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	public static boolean isSighIn(HttpServletRequest req) {
		return req.getSession().getAttribute("member") != null;
	}
	
	public static boolean isMine(HttpServletRequest req, String writer) {
		return isSighIn(req) && ((Member)req.getSession().getAttribute("member")).getId().equals(writer);
	}

	public static void main(String[] args) {
		getParams(null, Criteria.class);
	}
}
