package com.exadel.jstrong.web.fortrainings.util;

import com.exadel.jstrong.web.fortrainings.controller.EmployeeController;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * Created by Anton on 17.07.2015.
 */
public class CookieUtil {

    @Autowired
    private static EmployeeController ec;

    public static final String TOKEN = "token";

    public static String generateToken (){
        StringBuilder token = new StringBuilder();
        Date date = new Date();
        DateFormat df = new SimpleDateFormat("ddMMyyHHmmss");
        int number = (new Random()).nextInt();
        token.append(df.format(date)).append(Integer.toString(number));
        return token.toString();
    }

    public static Map<String, Cookie> cookiesToMap(Cookie[] cookies) {
        Map<String, Cookie> cookieMap = new HashMap<>();
        if (cookies == null) {
            return cookieMap;
        }
        for (Cookie cookie : cookies) {
            cookieMap.put(cookie.getName(), cookie);
        }
        return cookieMap;
    }

    public static int getUserId(HttpServletRequest request) {
        Map<String, Cookie> cookies = CookieUtil.cookiesToMap(request.getCookies());
        return ec.getIdByToken(cookies.get(CookieUtil.TOKEN).getValue());
    }

}
