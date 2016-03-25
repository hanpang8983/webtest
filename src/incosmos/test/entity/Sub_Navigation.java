package incosmos.test.entity;

import javax.persistence.*;

/**
 * Created by InCosmos on 2016/3/25.
 */
@Entity
@Table(name = "sub_navigation")
public class Sub_Navigation {
    @Column(name = "nav_id")
    private int nav_id;
    @Id
    @Column(name = "sub_nav_name")
    private String sub_nav_name;
    @Column(name = "sub_nav_url")
    private String sub_nav_url;
    @ManyToOne
    private Navigation navigation;

    public int getNav_id() {
        return nav_id;
    }

    public void setNav_id(int nav_id) {
        this.nav_id = nav_id;
    }

    public String getSub_nav_name() {
        return sub_nav_name;
    }

    public void setSub_nav_name(String sub_nav_name) {
        this.sub_nav_name = sub_nav_name;
    }

    public String getSub_nav_url() {
        return sub_nav_url;
    }

    public void setSub_nav_url(String sub_nav_url) {
        this.sub_nav_url = sub_nav_url;
    }
}
