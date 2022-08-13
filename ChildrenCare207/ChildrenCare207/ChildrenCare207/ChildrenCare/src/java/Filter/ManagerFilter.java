/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import Model.Role;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.User;

/**
 *
 * @author fannaby
 */
@WebFilter(filterName = "Manager", urlPatterns = {"/manager/*",})
public class ManagerFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
         HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        //ktra dang nhap
        User account = (User) session.getAttribute("account");
        if (account != null && account.getRole().getRoleID() == Role.ADMIN ||account.getRole().getRoleID() == Role.MANAGER ) {
            chain.doFilter(request, response);
            return;
        }
//        req.setAttribute("error", "Bạn không có quyền truy cập");
       res.sendRedirect("index.jsp");               
    }
    public void destroy() {
    }
    public void init(FilterConfig filterConfig) {
        
    }

}
