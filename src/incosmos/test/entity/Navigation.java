package incosmos.test.entity;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by InCosmos on 2016/3/25.
 */
@Entity
@Table(name = "navigation")
public class Navigation {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "nav_name")
    private String nav_name;

    @Column(name = "nav_url")
    private String nav_url;

    @OneToMany(mappedBy = "sub_navigation")
    private Set<Sub_Navigation> sub_navigations;


    public Set<Sub_Navigation> getSub_navigations() {
        return sub_navigations;
    }

    public void setSub_navigations(Set<Sub_Navigation> sub_navigations) {
        this.sub_navigations = sub_navigations;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNav_name() {
        return nav_name;
    }

    public void setNav_name(String nav_name) {
        this.nav_name = nav_name;
    }

    public String getNav_url() {
        return nav_url;
    }

    public void setNav_url(String nav_url) {
        this.nav_url = nav_url;
    }
}
