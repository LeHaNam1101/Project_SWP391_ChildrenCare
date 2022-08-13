/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;


import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.User;


/**
 *
 * @author fannaby
 */
@WebFilter(filterName = "AuthenticationFilter",
        urlPatterns = {"/admin/*","/staff/*","/manager/*","/add-to-cart","/carts","/delete-cart"})
public class AunthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        //ktra dang nhap
        User account = (User) session.getAttribute("account");
        if (account != null) {
            chain.doFilter(request, response);
        } else {
            Cookie[] cookies = req.getCookies();
            String username = null;
            String password = null;
            for (Cookie cooky : cookies) { // kiểm tra cookie 
                if (cooky.getName().equals("username")) {
                    username = cooky.getValue();
                }
                if (cooky.getName().equals("password")) {
                    password = cooky.getValue();
                }
                if (username != null && password != null) {
                    break;
                }
            }

            if (username != null && password != null) {
                User login = new UserDAO().login(username, password);
                if (account != null) { //cookie hợp lệ
                    session.setAttribute("account", account);
                    chain.doFilter(request, response);
                    return;
                }
            }
            res.sendRedirect("login");
        }

    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {

    }

}
