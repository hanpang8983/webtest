package incosmos.test.dao;

import incosmos.test.entity.Posts;

import java.util.List;

/**
 * Created by InCosmos on 2016/3/7.
 */
public interface PostsDao {
    List getAllPost();
    List getPagingPost(int start,int len);
    int getTotalRow();
}
