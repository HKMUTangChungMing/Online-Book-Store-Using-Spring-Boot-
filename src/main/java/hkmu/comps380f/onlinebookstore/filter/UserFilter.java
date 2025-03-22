package hkmu.comps380f.onlinebookstore.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Intercept all requests
 */
@WebFilter("/*")
public class UserFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("init");
    }
    //Pages that do not require login
    private static final String[] noLoginPages = {"index","detail","toLogin","toRegister","login","register",".css",".js",".map","h2-console"};

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        Object user = request.getSession().getAttribute("user");
        if(user!=null){
            //Already logged in, no need to block
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        for(String noLoginPage:noLoginPages){
//            System.out.println(request.getRequestURI()+"====1");
            if(request.getRequestURI().indexOf(noLoginPage)>-1){
//                System.out.println(request.getRequestURI()+"====2");
                //No need to block pages
                filterChain.doFilter(servletRequest, servletResponse);
                return;
            }
        }
        //Not logged in. Give an ID so that there will be a prompt box on the front end.
        request.setAttribute("needLogin", "y");
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //If the login fails, you can give some prompts to the front end.
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write("<script>alert('Not logged in or has expired, please log in');location.href='login'</script>");
    }

    @Override
    public void destroy() {
        System.out.println("destroy");
    }
}
