package incosmos.test.action;

import com.opensymphony.xwork2.ActionSupport;
import incosmos.test.dao.PostsDao;
import incosmos.test.entity.Posts;
import incosmos.test.util.JsonUtil;
import incosmos.test.util.PagingUtil;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.String;
import java.util.List;

/**
 * Created by InCosmos on 2016/2/22.
 */
public class test extends ActionSupport{
    private PostsDao pd;
    private List<Posts> posts;
    private PagingUtil page=new PagingUtil();

    public void getAllPost(){
        HttpServletResponse response=ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out;
        page.init(pd.getTotalRow());
        posts=pd.getPagingPost(page.getStart(),page.getPageRow());
        try {
            out= response.getWriter();
            out.write(JsonUtil.toJson(new Object[]{posts,page}));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String main_methodb(){
        System.out.println("进入方法2！");
        return "method2";
    }


    public PagingUtil getPage() {
        return page;
    }

    public void setPage(PagingUtil page) {
        this.page = page;
    }

    public List<Posts> getPosts() {
        return posts;
    }

    public void setPosts(List<Posts> posts) {
        this.posts = posts;
    }

    public PostsDao getPd() {
        return pd;
    }

    public void setPd(PostsDao pd) {
        this.pd = pd;
    }
}
