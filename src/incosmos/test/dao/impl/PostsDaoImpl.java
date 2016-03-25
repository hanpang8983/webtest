package incosmos.test.dao.impl;

import incosmos.test.dao.PostsDao;
import incosmos.test.entity.Posts;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by InCosmos on 2016/3/7.
 */
public class PostsDaoImpl extends HibernateDaoSupport implements PostsDao {

    @Override
    public List getAllPost() {

        return super.getHibernateTemplate().find("from Posts");
    }

    @Override
    public List getPagingPost(int start, int len) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List>() {
            @Override
            public List doInHibernate(Session session) throws HibernateException {
                Query q=session.createQuery("from Posts ");
                q.setFirstResult(start);
                q.setMaxResults(len);
                return q.list();
            }
        });
    }

    @Override
    public int getTotalRow() {
        return super.getHibernateTemplate().execute(new HibernateCallback<Integer>() {
            @Override
            public Integer doInHibernate(Session session) throws HibernateException {
                String hql="select count(*) from Posts";
                Query q=session.createQuery(hql);

                return Integer.parseInt(q.uniqueResult().toString());
            }
        });
    }
}
